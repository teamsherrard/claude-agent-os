#!/usr/bin/env node
/**
 * YouTube Launch Package — .docx Generator
 *
 * Usage: node generate-launch-doc.js <output-path> <json-data-path>
 *
 * The JSON data file should contain the launch package content structured as:
 * {
 *   videoTitle: string,
 *   date: string,
 *   sections: {
 *     seo: string (raw text),
 *     thumbnail: string (raw text),
 *     promoEmail: string (raw text),
 *     leadMagnet: string | null,
 *     leadMagnetEmail: string | null,
 *     carousel: string | null,
 *     platformCaptions: string (raw text),
 *     manychat: string | null,
 *     checklist: string (raw text)
 *   }
 * }
 *
 * Sections can be passed as raw text strings. The script parses markdown-style
 * formatting (##, -, *, ☐) into proper Word elements.
 *
 * This script is provided as a HELPER. Claude can also generate the .docx directly
 * using the docx npm package inline if preferred — the script standardizes formatting.
 */

const { Document, Packer, Paragraph, TextRun, Table, TableRow, TableCell,
        WidthType, AlignmentType, HeadingLevel, BorderStyle, PageBreak,
        ShadingType, LevelFormat, Header, Footer, PageNumber,
        TabStopType, TabStopPosition } = require('docx');
const fs = require('fs');
const path = require('path');

// Brand colors
const COLORS = {
  black: '000000',
  darkCharcoal: '1A1A2E',
  orange: 'E67E22',
  yellow: 'F5C518',
  purple: '6B2FA0',
  white: 'FFFFFF',
  lightGray: 'F2F2F2',
  medGray: '999999',
  borderGray: 'CCCCCC',
};

// US Letter page dimensions in DXA (1440 DXA = 1 inch)
const PAGE = {
  width: 12240,    // 8.5 inches
  height: 15840,   // 11 inches
  margin: 1440,    // 1 inch margins
  contentWidth: 9360, // 8.5 - 2 inches margins
};

function createSectionHeader(text) {
  return [
    new Paragraph({
      children: [new TextRun({ text: text, bold: true, size: 28, font: 'Arial', color: COLORS.darkCharcoal })],
      heading: HeadingLevel.HEADING_1,
      spacing: { before: 480, after: 120 },
      border: {
        bottom: { style: BorderStyle.SINGLE, size: 6, color: COLORS.purple, space: 8 },
      },
    }),
  ];
}

function createSubHeader(text) {
  return new Paragraph({
    children: [new TextRun({ text: text, bold: true, size: 24, font: 'Arial', color: COLORS.purple })],
    heading: HeadingLevel.HEADING_2,
    spacing: { before: 300, after: 120 },
  });
}

function createBody(text) {
  return new Paragraph({
    children: [new TextRun({ text, size: 22, font: 'Arial' })],
    spacing: { after: 120, line: 276 }, // 1.15 line spacing
  });
}

function createBoldLabel(label, value) {
  return new Paragraph({
    children: [
      new TextRun({ text: `${label}: `, bold: true, size: 22, font: 'Arial' }),
      new TextRun({ text: value, size: 22, font: 'Arial' }),
    ],
    spacing: { after: 100, line: 276 },
  });
}

// Numbering config for proper bullets and checkboxes
function getNumberingConfig() {
  return {
    config: [
      {
        reference: 'bullets',
        levels: [{
          level: 0,
          format: LevelFormat.BULLET,
          text: '\u2022',
          alignment: AlignmentType.LEFT,
          style: {
            paragraph: { indent: { left: 720, hanging: 360 } },
          },
        }],
      },
      {
        reference: 'checklist',
        levels: [{
          level: 0,
          format: LevelFormat.BULLET,
          text: '\u2610',
          alignment: AlignmentType.LEFT,
          style: {
            paragraph: { indent: { left: 720, hanging: 360 } },
          },
        }],
      },
      {
        reference: 'numbered',
        levels: [{
          level: 0,
          format: LevelFormat.DECIMAL,
          text: '%1.',
          alignment: AlignmentType.LEFT,
          style: {
            paragraph: { indent: { left: 720, hanging: 360 } },
          },
        }],
      },
    ],
  };
}

function createBullet(text) {
  return new Paragraph({
    numbering: { reference: 'bullets', level: 0 },
    children: [new TextRun({ text, size: 22, font: 'Arial' })],
    spacing: { after: 60, line: 276 },
  });
}

function createCheckbox(text) {
  return new Paragraph({
    numbering: { reference: 'checklist', level: 0 },
    children: [new TextRun({ text, size: 22, font: 'Arial' })],
    spacing: { after: 60, line: 276 },
  });
}

function createNumberedItem(text) {
  return new Paragraph({
    numbering: { reference: 'numbered', level: 0 },
    children: [new TextRun({ text, size: 22, font: 'Arial' })],
    spacing: { after: 60, line: 276 },
  });
}

function createPageBreak() {
  return new Paragraph({ children: [new PageBreak()] });
}

function buildTitlePage(videoTitle, date) {
  return [
    new Paragraph({ spacing: { before: 3600 } }), // Push content down
    new Paragraph({
      children: [new TextRun({ text: 'YOUTUBE LAUNCH PACKAGE', bold: true, size: 44, font: 'Arial', color: COLORS.darkCharcoal })],
      alignment: AlignmentType.CENTER,
      spacing: { after: 200 },
    }),
    new Paragraph({
      alignment: AlignmentType.CENTER,
      spacing: { before: 120, after: 120 },
      border: {
        bottom: { style: BorderStyle.SINGLE, size: 4, color: COLORS.purple, space: 1 },
      },
      children: [],
    }),
    new Paragraph({
      children: [new TextRun({ text: videoTitle, bold: true, size: 32, font: 'Arial', color: COLORS.purple })],
      alignment: AlignmentType.CENTER,
      spacing: { before: 300, after: 300 },
    }),
    new Paragraph({
      children: [new TextRun({ text: date, size: 22, font: 'Arial', color: COLORS.medGray })],
      alignment: AlignmentType.CENTER,
      spacing: { after: 80 },
    }),
    new Paragraph({
      children: [new TextRun({ text: 'Team Mike \u2014 Mike Sherrard', size: 22, font: 'Arial', color: COLORS.medGray })],
      alignment: AlignmentType.CENTER,
    }),
    createPageBreak(),
  ];
}

function buildSectionFromText(sectionTitle, content) {
  const paragraphs = [...createSectionHeader(sectionTitle)];
  const lines = content.split('\n');
  for (const line of lines) {
    const trimmed = line.trim();
    if (!trimmed) continue;
    if (trimmed.startsWith('### ')) {
      paragraphs.push(createSubHeader(trimmed.replace('### ', '')));
    } else if (trimmed.startsWith('## ')) {
      paragraphs.push(createSubHeader(trimmed.replace('## ', '')));
    } else if (trimmed.startsWith('- [ ] ') || trimmed.startsWith('- [x] ')) {
      paragraphs.push(createCheckbox(trimmed.replace(/^- \[[ x]\] /, '')));
    } else if (trimmed.startsWith('☐ ')) {
      paragraphs.push(createCheckbox(trimmed.replace('☐ ', '')));
    } else if (trimmed.startsWith('- ') || trimmed.startsWith('* ')) {
      paragraphs.push(createBullet(trimmed.replace(/^[-*] /, '')));
    } else if (/^\d+[\.\)] /.test(trimmed)) {
      paragraphs.push(createNumberedItem(trimmed.replace(/^\d+[\.\)] /, '')));
    } else if (trimmed.includes(': ') && trimmed.split(': ')[0].length < 30 && /^[A-Z*]/.test(trimmed)) {
      const [label, ...rest] = trimmed.split(': ');
      paragraphs.push(createBoldLabel(label.replace(/^\*+|\*+$/g, ''), rest.join(': ')));
    } else {
      paragraphs.push(createBody(trimmed));
    }
  }
  paragraphs.push(createPageBreak());
  return paragraphs;
}

async function main() {
  const args = process.argv.slice(2);
  if (args.length < 2) {
    console.log('Usage: node generate-launch-doc.js <output-path> <json-data-path>');
    console.log('');
    console.log('Note: This script is a helper. Claude can also build the .docx directly');
    console.log('using the docx npm package inline when generating launch packages.');
    process.exit(1);
  }

  const outputPath = args[0];
  const dataPath = args[1];

  let data;
  try {
    data = JSON.parse(fs.readFileSync(dataPath, 'utf-8'));
  } catch (e) {
    console.error(`Failed to read data file: ${e.message}`);
    process.exit(1);
  }

  const allParagraphs = [];

  // Title page
  allParagraphs.push(...buildTitlePage(data.videoTitle || 'Untitled Video', data.date || new Date().toLocaleDateString()));

  // Build each section from the sections object
  if (data.sections) {
    const s = data.sections;

    if (s.thumbnail) allParagraphs.push(...buildSectionFromText('THUMBNAIL BRIEF FOR DESIGNER', s.thumbnail));
    if (s.seo) allParagraphs.push(...buildSectionFromText('YOUTUBE SEO PACKAGE', s.seo));
    if (s.promoEmail) allParagraphs.push(...buildSectionFromText('PROMOTIONAL EMAIL', s.promoEmail));
    if (s.leadMagnet) allParagraphs.push(...buildSectionFromText('LEAD MAGNET CONTENT', s.leadMagnet));
    if (s.leadMagnetEmail) allParagraphs.push(...buildSectionFromText('LEAD MAGNET DELIVERY EMAIL', s.leadMagnetEmail));
    if (s.carousel) allParagraphs.push(...buildSectionFromText('CAROUSEL COPY', s.carousel));
    if (s.platformCaptions) allParagraphs.push(...buildSectionFromText('PLATFORM CAPTIONS', s.platformCaptions));
    if (s.manychat) allParagraphs.push(...buildSectionFromText('MANYCHAT DM SEQUENCE', s.manychat));
    if (s.checklist) allParagraphs.push(...buildSectionFromText('LAUNCH CHECKLIST', s.checklist));
  }

  // If sections are passed as raw text strings (simpler approach)
  if (data.rawSections) {
    for (const section of data.rawSections) {
      allParagraphs.push(...buildSectionFromText(section.title, section.content));
    }
  }

  const doc = new Document({
    styles: {
      default: {
        document: {
          run: { font: 'Arial', size: 22 }, // 11pt default
        },
      },
      paragraphStyles: [
        {
          id: 'Heading1', name: 'Heading 1', basedOn: 'Normal', next: 'Normal', quickFormat: true,
          run: { size: 28, bold: true, font: 'Arial', color: COLORS.darkCharcoal },
          paragraph: { spacing: { before: 480, after: 120 }, outlineLevel: 0 },
        },
        {
          id: 'Heading2', name: 'Heading 2', basedOn: 'Normal', next: 'Normal', quickFormat: true,
          run: { size: 24, bold: true, font: 'Arial', color: COLORS.purple },
          paragraph: { spacing: { before: 300, after: 120 }, outlineLevel: 1 },
        },
      ],
    },
    numbering: getNumberingConfig(),
    sections: [{
      properties: {
        page: {
          size: { width: PAGE.width, height: PAGE.height },
          margin: { top: PAGE.margin, bottom: PAGE.margin, left: PAGE.margin, right: PAGE.margin },
        },
      },
      headers: {
        default: new Header({
          children: [new Paragraph({
            children: [
              new TextRun({ text: 'YouTube Launch Package', size: 16, font: 'Arial', color: COLORS.medGray, italics: true }),
            ],
            border: {
              bottom: { style: BorderStyle.SINGLE, size: 1, color: COLORS.borderGray, space: 4 },
            },
            spacing: { after: 200 },
          })],
        }),
      },
      footers: {
        default: new Footer({
          children: [new Paragraph({
            children: [
              new TextRun({ text: 'Team Mike \u2014 Mike Sherrard', size: 16, font: 'Arial', color: COLORS.medGray }),
              new TextRun({ text: '\t', size: 16 }),
              new TextRun({ text: 'Page ', size: 16, font: 'Arial', color: COLORS.medGray }),
              new TextRun({ children: [PageNumber.CURRENT], size: 16, font: 'Arial', color: COLORS.medGray }),
            ],
            tabStops: [{ type: TabStopType.RIGHT, position: TabStopPosition.MAX }],
            border: {
              top: { style: BorderStyle.SINGLE, size: 1, color: COLORS.borderGray, space: 4 },
            },
          })],
        }),
      },
      children: allParagraphs,
    }],
  });

  const buffer = await Packer.toBuffer(doc);
  fs.writeFileSync(outputPath, buffer);
  console.log(`Launch package saved to: ${outputPath}`);
}

main().catch(console.error);
