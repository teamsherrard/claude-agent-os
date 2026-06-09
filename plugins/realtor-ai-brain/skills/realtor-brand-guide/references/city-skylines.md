# City Skyline SVG Reference

Each skyline fits a `viewBox="0 0 500 130"` canvas. Buildings use `fill="var(--primary)"` with accents at `fill="var(--secondary)"`. Adjust opacity for depth layering (background buildings: 0.35–0.5, foreground: 1.0).

Ground line: `<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>`

---

## Calgary

```svg
<!-- Background -->
<rect x="0" y="70" width="35" height="60" fill="var(--primary)" opacity="0.35"/>
<rect x="45" y="55" width="30" height="75" fill="var(--primary)" opacity="0.35"/>
<!-- Bow Tower (tallest, distinctive stepped top) -->
<rect x="100" y="10" width="38" height="120" fill="var(--primary)"/>
<rect x="108" y="5" width="22" height="12" fill="var(--primary)"/>
<!-- Suncor Energy Centre -->
<rect x="155" y="30" width="30" height="100" fill="var(--primary)" opacity="0.85"/>
<!-- Mid buildings -->
<rect x="200" y="50" width="25" height="80" fill="var(--primary)" opacity="0.7"/>
<rect x="235" y="40" width="28" height="90" fill="var(--primary)"/>
<!-- Telus Sky (angular) -->
<polygon points="275,20 305,20 300,130 280,130" fill="var(--secondary)" opacity="0.9"/>
<!-- Right fill -->
<rect x="315" y="60" width="40" height="70" fill="var(--primary)" opacity="0.6"/>
<rect x="365" y="45" width="30" height="85" fill="var(--primary)" opacity="0.8"/>
<rect x="405" y="70" width="45" height="60" fill="var(--primary)" opacity="0.4"/>
<rect x="460" y="55" width="40" height="75" fill="var(--primary)" opacity="0.5"/>
```

## Vancouver

```svg
<!-- Background mountains (triangles) -->
<polygon points="0,60 60,10 120,60" fill="var(--secondary)" opacity="0.2"/>
<polygon points="80,60 150,5 220,60" fill="var(--secondary)" opacity="0.15"/>
<polygon points="320,60 400,8 480,60" fill="var(--secondary)" opacity="0.2"/>
<!-- Harbour Centre (tower with disc top) -->
<rect x="100" y="30" width="16" height="100" fill="var(--primary)"/>
<ellipse cx="108" cy="30" rx="24" ry="8" fill="var(--secondary)"/>
<!-- Downtown towers -->
<rect x="135" y="45" width="32" height="85" fill="var(--primary)"/>
<rect x="178" y="35" width="28" height="95" fill="var(--primary)" opacity="0.9"/>
<rect x="218" y="50" width="25" height="80" fill="var(--primary)" opacity="0.8"/>
<!-- Living Shangri-La (tapered) -->
<polygon points="255,15 285,15 282,130 258,130" fill="var(--secondary)" opacity="0.85"/>
<!-- Right cluster -->
<rect x="295" y="55" width="30" height="75" fill="var(--primary)" opacity="0.7"/>
<rect x="336" y="40" width="28" height="90" fill="var(--primary)"/>
<rect x="375" y="65" width="35" height="65" fill="var(--primary)" opacity="0.5"/>
```

## Toronto

```svg
<!-- CN Tower -->
<rect x="60" y="0" width="8" height="130" fill="var(--secondary)"/>
<ellipse cx="64" cy="45" rx="18" ry="6" fill="var(--secondary)"/>
<circle cx="64" cy="35" r="4" fill="var(--primary)"/>
<!-- SkyDome dome -->
<ellipse cx="85" cy="120" rx="35" ry="16" fill="var(--primary)" opacity="0.4"/>
<!-- Downtown core -->
<rect x="130" y="20" width="35" height="110" fill="var(--primary)"/>
<rect x="175" y="35" width="30" height="95" fill="var(--primary)" opacity="0.9"/>
<rect x="215" y="25" width="28" height="105" fill="var(--primary)"/>
<!-- First Canadian Place -->
<rect x="255" y="10" width="32" height="120" fill="var(--secondary)" opacity="0.85"/>
<rect x="263" y="5" width="16" height="8" fill="var(--secondary)"/>
<!-- Right buildings -->
<rect x="300" y="40" width="30" height="90" fill="var(--primary)" opacity="0.8"/>
<rect x="340" y="55" width="25" height="75" fill="var(--primary)" opacity="0.7"/>
<rect x="375" y="35" width="38" height="95" fill="var(--primary)" opacity="0.85"/>
<rect x="425" y="60" width="40" height="70" fill="var(--primary)" opacity="0.5"/>
<rect x="476" y="45" width="24" height="85" fill="var(--primary)" opacity="0.6"/>
```

## Austin

```svg
<!-- Texas State Capitol dome -->
<rect x="60" y="50" width="50" height="80" fill="var(--primary)" opacity="0.6"/>
<ellipse cx="85" cy="50" rx="28" ry="12" fill="var(--secondary)" opacity="0.7"/>
<rect x="80" y="30" width="10" height="22" fill="var(--secondary)"/>
<!-- Downtown towers -->
<rect x="130" y="30" width="32" height="100" fill="var(--primary)"/>
<rect x="172" y="20" width="28" height="110" fill="var(--primary)" opacity="0.9"/>
<!-- Frost Bank Tower (angular crown) -->
<polygon points="215,15 243,15 240,50 218,50" fill="var(--secondary)" opacity="0.9"/>
<rect x="218" y="50" width="22" height="80" fill="var(--secondary)" opacity="0.85"/>
<!-- Right fill -->
<rect x="255" y="40" width="30" height="90" fill="var(--primary)" opacity="0.8"/>
<rect x="296" y="55" width="35" height="75" fill="var(--primary)" opacity="0.7"/>
<rect x="342" y="35" width="28" height="95" fill="var(--primary)"/>
<rect x="382" y="60" width="40" height="70" fill="var(--primary)" opacity="0.5"/>
<rect x="432" y="45" width="30" height="85" fill="var(--primary)" opacity="0.65"/>
<rect x="470" y="65" width="30" height="65" fill="var(--primary)" opacity="0.4"/>
```

## Phoenix / Scottsdale

```svg
<!-- Saguaro cacti (left) -->
<rect x="15" y="70" width="8" height="60" fill="var(--secondary)" opacity="0.5"/>
<rect x="8" y="85" width="16" height="6" rx="3" fill="var(--secondary)" opacity="0.5"/>
<!-- Downtown cluster -->
<rect x="60" y="50" width="30" height="80" fill="var(--primary)" opacity="0.7"/>
<rect x="100" y="35" width="35" height="95" fill="var(--primary)"/>
<rect x="145" y="45" width="28" height="85" fill="var(--primary)" opacity="0.9"/>
<!-- Chase Tower (tallest) -->
<rect x="185" y="15" width="40" height="115" fill="var(--secondary)" opacity="0.9"/>
<rect x="192" y="10" width="26" height="8" fill="var(--secondary)"/>
<!-- Mid cluster -->
<rect x="240" y="40" width="32" height="90" fill="var(--primary)" opacity="0.85"/>
<rect x="284" y="55" width="28" height="75" fill="var(--primary)" opacity="0.7"/>
<rect x="323" y="35" width="30" height="95" fill="var(--primary)"/>
<!-- Cactus (right) -->
<rect x="477" y="65" width="8" height="65" fill="var(--secondary)" opacity="0.5"/>
<rect x="470" y="80" width="16" height="6" rx="3" fill="var(--secondary)" opacity="0.5"/>
<!-- Right fill buildings -->
<rect x="365" y="50" width="35" height="80" fill="var(--primary)" opacity="0.6"/>
<rect x="410" y="65" width="40" height="65" fill="var(--primary)" opacity="0.45"/>
```

## Denver

```svg
<!-- Rocky Mountains (background) -->
<polygon points="0,70 70,5 140,70" fill="var(--secondary)" opacity="0.15"/>
<polygon points="100,70 175,10 250,70" fill="var(--secondary)" opacity="0.12"/>
<polygon points="350,70 430,8 510,70" fill="var(--secondary)" opacity="0.15"/>
<!-- Colorado State Capitol dome -->
<rect x="55" y="55" width="45" height="75" fill="var(--primary)" opacity="0.5"/>
<ellipse cx="77" cy="55" rx="25" ry="10" fill="var(--secondary)" opacity="0.6"/>
<rect x="73" y="38" width="8" height="19" fill="var(--secondary)" opacity="0.8"/>
<!-- 1670 Broadway -->
<rect x="120" y="30" width="32" height="100" fill="var(--primary)"/>
<!-- Republic Plaza (tallest) -->
<rect x="165" y="10" width="35" height="120" fill="var(--secondary)" opacity="0.9"/>
<rect x="172" y="5" width="21" height="8" fill="var(--secondary)"/>
<!-- Right cluster -->
<rect x="215" y="35" width="28" height="95" fill="var(--primary)" opacity="0.85"/>
<rect x="255" y="45" width="30" height="85" fill="var(--primary)" opacity="0.8"/>
<rect x="300" y="55" width="35" height="75" fill="var(--primary)" opacity="0.7"/>
<rect x="348" y="40" width="28" height="90" fill="var(--primary)"/>
<rect x="390" y="60" width="40" height="70" fill="var(--primary)" opacity="0.5"/>
<rect x="444" y="45" width="30" height="85" fill="var(--primary)" opacity="0.6"/>
```

## Miami

```svg
<!-- Palm trees (left) -->
<rect x="10" y="80" width="6" height="50" fill="var(--secondary)" opacity="0.6"/>
<ellipse cx="13" cy="78" rx="15" ry="8" fill="var(--secondary)" opacity="0.5"/>
<!-- Art Deco + modern mix -->
<rect x="45" y="55" width="28" height="75" fill="var(--primary)" opacity="0.6"/>
<!-- Brickell City Centre -->
<rect x="85" y="25" width="35" height="105" fill="var(--primary)"/>
<rect x="130" y="35" width="28" height="95" fill="var(--primary)" opacity="0.85"/>
<!-- 1000 Museum (curved) -->
<rect x="170" y="15" width="30" height="115" fill="var(--secondary)" opacity="0.9"/>
<rect x="165" y="15" width="40" height="8" rx="4" fill="var(--secondary)"/>
<!-- Mid towers -->
<rect x="215" y="30" width="32" height="100" fill="var(--primary)" opacity="0.9"/>
<rect x="260" y="20" width="28" height="110" fill="var(--primary)"/>
<rect x="300" y="40" width="30" height="90" fill="var(--primary)" opacity="0.8"/>
<!-- Palm right -->
<rect x="484" y="75" width="6" height="55" fill="var(--secondary)" opacity="0.6"/>
<ellipse cx="487" cy="73" rx="15" ry="8" fill="var(--secondary)" opacity="0.5"/>
<!-- Right fill -->
<rect x="345" y="50" width="35" height="80" fill="var(--primary)" opacity="0.7"/>
<rect x="392" y="35" width="28" height="95" fill="var(--primary)"/>
<rect x="432" y="60" width="40" height="70" fill="var(--primary)" opacity="0.5"/>
```

## Nashville

```svg
<!-- AT&T Building (Batman building - twin spires) -->
<rect x="80" y="30" width="40" height="100" fill="var(--primary)"/>
<rect x="85" y="15" width="8" height="18" fill="var(--primary)"/>
<rect x="107" y="15" width="8" height="18" fill="var(--primary)"/>
<!-- Downtown cluster -->
<rect x="135" y="45" width="30" height="85" fill="var(--primary)" opacity="0.85"/>
<rect x="178" y="35" width="28" height="95" fill="var(--secondary)" opacity="0.8"/>
<rect x="220" y="50" width="32" height="80" fill="var(--primary)" opacity="0.9"/>
<!-- Broadway honky-tonk row (low, wide) -->
<rect x="260" y="85" width="60" height="45" fill="var(--secondary)" opacity="0.5"/>
<rect x="330" y="80" width="50" height="50" fill="var(--secondary)" opacity="0.4"/>
<!-- Right towers -->
<rect x="395" y="40" width="30" height="90" fill="var(--primary)" opacity="0.8"/>
<rect x="438" y="55" width="35" height="75" fill="var(--primary)" opacity="0.7"/>
<rect x="18" y="65" width="40" height="65" fill="var(--primary)" opacity="0.45"/>
```

## Generic / Unknown City

Use this for any city not listed above or for custom abstract shapes:

```svg
<!-- Abstract geometric skyline -->
<rect x="30" y="80" width="25" height="50" fill="var(--primary)" opacity="0.4"/>
<rect x="70" y="55" width="30" height="75" fill="var(--primary)" opacity="0.6"/>
<rect x="115" y="35" width="28" height="95" fill="var(--primary)" opacity="0.8"/>
<rect x="158" y="20" width="35" height="110" fill="var(--primary)"/>
<!-- Center landmark -->
<polygon points="208,10 228,10 225,40 211,40" fill="var(--secondary)" opacity="0.9"/>
<rect x="211" y="40" width="14" height="90" fill="var(--secondary)" opacity="0.85"/>
<!-- Right cluster -->
<rect x="245" y="30" width="32" height="100" fill="var(--primary)" opacity="0.9"/>
<rect x="290" y="45" width="28" height="85" fill="var(--primary)" opacity="0.8"/>
<rect x="332" y="60" width="30" height="70" fill="var(--primary)" opacity="0.7"/>
<rect x="378" y="40" width="35" height="90" fill="var(--primary)" opacity="0.85"/>
<rect x="426" y="65" width="28" height="65" fill="var(--primary)" opacity="0.55"/>
<rect x="464" y="50" width="22" height="80" fill="var(--primary)" opacity="0.45"/>
```

## Atlanta

```svg
<!-- Westin Peachtree Plaza (cylindrical tower) -->
<ellipse cx="85" cy="25" rx="10" ry="6" fill="var(--secondary)" opacity="0.9"/>
<rect x="75" y="25" width="20" height="105" fill="var(--secondary)" opacity="0.9"/>
<!-- Bank of America Plaza (pointed spire) -->
<polygon points="130,5 140,5 138,30 132,30" fill="var(--primary)"/>
<rect x="132" y="30" width="6" height="100" fill="var(--primary)"/>
<!-- Downtown cluster -->
<rect x="150" y="35" width="32" height="95" fill="var(--primary)"/>
<rect x="192" y="25" width="28" height="105" fill="var(--primary)" opacity="0.9"/>
<rect x="230" y="40" width="30" height="90" fill="var(--primary)" opacity="0.85"/>
<rect x="270" y="50" width="35" height="80" fill="var(--primary)" opacity="0.8"/>
<!-- Right cluster -->
<rect x="316" y="35" width="28" height="95" fill="var(--secondary)" opacity="0.85"/>
<rect x="355" y="45" width="32" height="85" fill="var(--primary)" opacity="0.9"/>
<rect x="398" y="55" width="30" height="75" fill="var(--primary)" opacity="0.7"/>
<rect x="440" y="40" width="28" height="90" fill="var(--primary)" opacity="0.8"/>
<rect x="478" y="60" width="22" height="70" fill="var(--primary)" opacity="0.5"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Chicago

```svg
<!-- Willis Tower (stepped crown) -->
<rect x="55" y="5" width="32" height="125" fill="var(--primary)"/>
<rect x="60" y="5" width="22" height="20" fill="var(--primary)"/>
<rect x="63" y="5" width="16" height="35" fill="var(--primary)"/>
<!-- John Hancock (tapered with antennas) -->
<polygon points="110,15 138,15 136,70 112,70" fill="var(--secondary)" opacity="0.9"/>
<rect x="121" y="15" width="4" height="18" fill="var(--secondary)"/>
<rect x="128" y="15" width="4" height="18" fill="var(--secondary)"/>
<rect x="112" y="70" width="24" height="60" fill="var(--secondary)" opacity="0.85"/>
<!-- Marina City towers (circular) -->
<ellipse cx="170" cy="50" rx="10" ry="5" fill="var(--primary)" opacity="0.6"/>
<rect x="160" y="50" width="20" height="78" fill="var(--primary)" opacity="0.6"/>
<ellipse cx="200" cy="50" rx="10" ry="5" fill="var(--primary)" opacity="0.6"/>
<rect x="190" y="50" width="20" height="78" fill="var(--primary)" opacity="0.6"/>
<!-- Mid cluster -->
<rect x="230" y="30" width="30" height="100" fill="var(--primary)" opacity="0.8"/>
<rect x="270" y="40" width="28" height="90" fill="var(--primary)" opacity="0.85"/>
<rect x="308" y="50" width="25" height="80" fill="var(--primary)" opacity="0.7"/>
<!-- Right fill -->
<rect x="345" y="35" width="30" height="95" fill="var(--primary)" opacity="0.75"/>
<rect x="386" y="55" width="35" height="75" fill="var(--primary)" opacity="0.6"/>
<rect x="432" y="45" width="28" height="85" fill="var(--primary)" opacity="0.65"/>
<rect x="470" y="60" width="30" height="70" fill="var(--primary)" opacity="0.45"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Houston

```svg
<!-- JPMorgan Chase Tower (tapered) -->
<polygon points="60,8 90,8 88,50 62,50" fill="var(--secondary)" opacity="0.9"/>
<rect x="62" y="50" width="26" height="78" fill="var(--secondary)" opacity="0.85"/>
<!-- Williams Tower (tall rectangle) -->
<rect x="105" y="18" width="28" height="110" fill="var(--primary)"/>
<!-- Downtown cluster -->
<rect x="145" y="30" width="30" height="100" fill="var(--primary)" opacity="0.9"/>
<rect x="185" y="22" width="25" height="108" fill="var(--primary)"/>
<rect x="220" y="35" width="28" height="95" fill="var(--primary)" opacity="0.85"/>
<!-- Pennzoil Place (twin trapezoidal) -->
<polygon points="260,20 280,20 278,128 262,128" fill="var(--primary)" opacity="0.8"/>
<polygon points="290,20 310,20 308,128 292,128" fill="var(--primary)" opacity="0.8"/>
<!-- Right fill -->
<rect x="325" y="40" width="32" height="90" fill="var(--primary)" opacity="0.75"/>
<rect x="368" y="50" width="28" height="80" fill="var(--primary)" opacity="0.7"/>
<rect x="408" y="35" width="30" height="95" fill="var(--primary)" opacity="0.8"/>
<rect x="450" y="55" width="25" height="75" fill="var(--primary)" opacity="0.6"/>
<rect x="478" y="65" width="22" height="63" fill="var(--primary)" opacity="0.45"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Seattle

```svg
<!-- Space Needle -->
<rect x="55" y="60" width="8" height="68" fill="var(--secondary)"/>
<polygon points="44,55 72,55 68,68 56,68" fill="var(--secondary)"/>
<rect x="56" y="30" width="6" height="32" fill="var(--secondary)" opacity="0.8"/>
<!-- Columbia Center (tallest) -->
<rect x="100" y="15" width="28" height="113" fill="var(--primary)"/>
<!-- Downtown cluster -->
<rect x="140" y="30" width="25" height="98" fill="var(--primary)" opacity="0.9"/>
<rect x="175" y="22" width="30" height="106" fill="var(--primary)"/>
<rect x="215" y="35" width="28" height="93" fill="var(--primary)" opacity="0.85"/>
<!-- Pacific First Center (angular top) -->
<polygon points="255,20 283,20 280,45 258,45" fill="var(--secondary)" opacity="0.85"/>
<rect x="258" y="45" width="22" height="83" fill="var(--secondary)" opacity="0.8"/>
<!-- Right cluster + mountains hint -->
<polygon points="310,70 355,25 400,70" fill="var(--secondary)" opacity="0.12"/>
<rect x="320" y="40" width="28" height="88" fill="var(--primary)" opacity="0.8"/>
<rect x="360" y="50" width="30" height="78" fill="var(--primary)" opacity="0.75"/>
<rect x="402" y="42" width="26" height="86" fill="var(--primary)" opacity="0.7"/>
<rect x="440" y="55" width="30" height="73" fill="var(--primary)" opacity="0.6"/>
<rect x="478" y="65" width="22" height="63" fill="var(--primary)" opacity="0.45"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Las Vegas

```svg
<!-- Stratosphere Tower -->
<rect x="45" y="10" width="8" height="118" fill="var(--secondary)"/>
<ellipse cx="49" cy="40" rx="18" ry="7" fill="var(--secondary)"/>
<rect x="46" y="10" width="6" height="15" fill="var(--secondary)"/>
<!-- MGM/Aria towers -->
<rect x="90" y="40" width="30" height="88" fill="var(--primary)" opacity="0.7"/>
<rect x="130" y="30" width="28" height="98" fill="var(--primary)"/>
<rect x="168" y="25" width="32" height="103" fill="var(--primary)" opacity="0.9"/>
<!-- Vdara (curved top) -->
<ellipse cx="220" cy="22" rx="16" ry="5" fill="var(--secondary)" opacity="0.9"/>
<rect x="204" y="22" width="32" height="106" fill="var(--secondary)" opacity="0.85"/>
<!-- More strip towers -->
<rect x="248" y="35" width="28" height="93" fill="var(--primary)" opacity="0.8"/>
<rect x="286" y="45" width="30" height="83" fill="var(--primary)" opacity="0.75"/>
<rect x="326" y="38" width="26" height="90" fill="var(--primary)" opacity="0.7"/>
<rect x="364" y="50" width="28" height="78" fill="var(--primary)" opacity="0.65"/>
<rect x="404" y="42" width="32" height="86" fill="var(--primary)" opacity="0.7"/>
<rect x="448" y="55" width="25" height="73" fill="var(--primary)" opacity="0.5"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Boston

```svg
<!-- Prudential Tower -->
<rect x="50" y="8" width="28" height="120" fill="var(--primary)"/>
<rect x="57" y="5" width="14" height="8" fill="var(--primary)"/>
<!-- John Hancock (glass, tall) -->
<rect x="92" y="18" width="26" height="110" fill="var(--secondary)" opacity="0.85"/>
<rect x="97" y="15" width="16" height="6" fill="var(--secondary)"/>
<!-- Back Bay cluster -->
<rect x="130" y="35" width="25" height="93" fill="var(--primary)" opacity="0.8"/>
<rect x="165" y="28" width="28" height="100" fill="var(--primary)" opacity="0.9"/>
<!-- Old South Church dome hint -->
<rect x="205" y="60" width="35" height="68" fill="var(--primary)" opacity="0.6"/>
<ellipse cx="222" cy="60" rx="18" ry="7" fill="var(--secondary)" opacity="0.5"/>
<!-- Financial district -->
<rect x="255" y="40" width="28" height="88" fill="var(--primary)" opacity="0.85"/>
<rect x="294" y="32" width="25" height="96" fill="var(--primary)"/>
<rect x="330" y="45" width="30" height="83" fill="var(--primary)" opacity="0.8"/>
<rect x="372" y="55" width="28" height="73" fill="var(--primary)" opacity="0.7"/>
<rect x="412" y="42" width="26" height="86" fill="var(--primary)" opacity="0.65"/>
<rect x="450" y="58" width="30" height="70" fill="var(--primary)" opacity="0.5"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Minneapolis

```svg
<!-- IDS Center (stepped crown) -->
<rect x="55" y="12" width="30" height="116" fill="var(--primary)"/>
<rect x="60" y="8" width="20" height="8" fill="var(--primary)"/>
<!-- 225 South Sixth (Wells Fargo Center) -->
<polygon points="100,18 128,18 125,45 103,45" fill="var(--secondary)" opacity="0.9"/>
<rect x="103" y="45" width="22" height="83" fill="var(--secondary)" opacity="0.85"/>
<!-- Downtown cluster -->
<rect x="140" y="28" width="26" height="100" fill="var(--primary)" opacity="0.9"/>
<rect x="176" y="35" width="28" height="93" fill="var(--primary)" opacity="0.85"/>
<rect x="214" y="42" width="24" height="86" fill="var(--primary)" opacity="0.8"/>
<rect x="248" y="30" width="30" height="98" fill="var(--primary)"/>
<!-- Skyway bridges (thin horizontal connectors) -->
<rect x="100" y="80" width="50" height="4" fill="var(--secondary)" opacity="0.35"/>
<rect x="176" y="75" width="72" height="4" fill="var(--secondary)" opacity="0.35"/>
<!-- Right fill -->
<rect x="290" y="45" width="28" height="83" fill="var(--primary)" opacity="0.75"/>
<rect x="330" y="55" width="32" height="73" fill="var(--primary)" opacity="0.65"/>
<rect x="374" y="42" width="26" height="86" fill="var(--primary)" opacity="0.7"/>
<rect x="412" y="58" width="30" height="70" fill="var(--primary)" opacity="0.55"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Charlotte

```svg
<!-- Bank of America Corporate Center (crown) -->
<polygon points="52,8 78,8 75,35 55,35" fill="var(--secondary)" opacity="0.9"/>
<rect x="55" y="35" width="20" height="93" fill="var(--secondary)" opacity="0.85"/>
<!-- Duke Energy Center -->
<rect x="92" y="20" width="28" height="108" fill="var(--primary)"/>
<rect x="97" y="15" width="18" height="8" fill="var(--primary)"/>
<!-- Truist Center -->
<rect x="132" y="28" width="26" height="100" fill="var(--primary)" opacity="0.9"/>
<!-- Downtown cluster -->
<rect x="168" y="35" width="28" height="93" fill="var(--primary)" opacity="0.85"/>
<rect x="206" y="40" width="25" height="88" fill="var(--primary)" opacity="0.8"/>
<rect x="241" y="30" width="30" height="98" fill="var(--primary)" opacity="0.9"/>
<rect x="282" y="42" width="28" height="86" fill="var(--primary)" opacity="0.8"/>
<!-- Right fill -->
<rect x="322" y="50" width="30" height="78" fill="var(--primary)" opacity="0.7"/>
<rect x="364" y="40" width="26" height="88" fill="var(--primary)" opacity="0.75"/>
<rect x="402" y="55" width="28" height="73" fill="var(--primary)" opacity="0.6"/>
<rect x="442" y="45" width="30" height="83" fill="var(--primary)" opacity="0.65"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## San Diego

```svg
<!-- One America Plaza (crown spire) -->
<rect x="48" y="55" width="8" height="73" fill="var(--secondary)"/>
<polygon points="40,50 64,50 60,58 52,58" fill="var(--secondary)"/>
<!-- Encore (curved) -->
<rect x="70" y="25" width="26" height="103" fill="var(--primary)"/>
<ellipse cx="83" cy="25" rx="13" ry="5" fill="var(--primary)" opacity="0.8"/>
<!-- Downtown cluster -->
<rect x="108" y="35" width="28" height="93" fill="var(--primary)" opacity="0.9"/>
<rect x="146" y="28" width="25" height="100" fill="var(--primary)"/>
<rect x="181" y="40" width="28" height="88" fill="var(--primary)" opacity="0.85"/>
<!-- Palm trees (coastal signal) -->
<rect x="220" y="80" width="5" height="48" fill="var(--secondary)" opacity="0.5"/>
<ellipse cx="222" cy="78" rx="12" ry="7" fill="var(--secondary)" opacity="0.4"/>
<!-- More downtown -->
<rect x="240" y="38" width="26" height="90" fill="var(--primary)" opacity="0.8"/>
<rect x="278" y="48" width="28" height="80" fill="var(--primary)" opacity="0.75"/>
<rect x="318" y="35" width="30" height="93" fill="var(--primary)" opacity="0.8"/>
<!-- Palm right -->
<rect x="362" y="80" width="5" height="48" fill="var(--secondary)" opacity="0.5"/>
<ellipse cx="364" cy="78" rx="12" ry="7" fill="var(--secondary)" opacity="0.4"/>
<rect x="380" y="45" width="28" height="83" fill="var(--primary)" opacity="0.7"/>
<rect x="420" y="55" width="30" height="73" fill="var(--primary)" opacity="0.6"/>
<rect x="462" y="48" width="28" height="80" fill="var(--primary)" opacity="0.65"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Tampa

```svg
<!-- Synovus Financial Center -->
<rect x="55" y="22" width="26" height="106" fill="var(--primary)"/>
<rect x="60" y="18" width="16" height="7" fill="var(--primary)"/>
<!-- Park Tower -->
<rect x="92" y="30" width="24" height="98" fill="var(--secondary)" opacity="0.9"/>
<!-- Downtown cluster -->
<rect x="128" y="38" width="26" height="90" fill="var(--primary)" opacity="0.85"/>
<rect x="164" y="28" width="28" height="100" fill="var(--primary)"/>
<rect x="202" y="40" width="25" height="88" fill="var(--primary)" opacity="0.8"/>
<!-- Water hint (Tampa Bay) -->
<ellipse cx="260" cy="128" rx="50" ry="8" fill="var(--secondary)" opacity="0.15"/>
<rect x="240" y="45" width="28" height="83" fill="var(--primary)" opacity="0.75"/>
<rect x="280" y="35" width="30" height="93" fill="var(--primary)" opacity="0.8"/>
<rect x="322" y="48" width="26" height="80" fill="var(--primary)" opacity="0.7"/>
<rect x="360" y="42" width="28" height="86" fill="var(--primary)" opacity="0.65"/>
<rect x="400" y="55" width="30" height="73" fill="var(--primary)" opacity="0.6"/>
<rect x="445" y="48" width="26" height="80" fill="var(--primary)" opacity="0.55"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Salt Lake City

```svg
<!-- Rocky Mountains (background) -->
<polygon points="0,70 80,12 160,70" fill="var(--secondary)" opacity="0.12"/>
<polygon points="120,70 210,5 300,70" fill="var(--secondary)" opacity="0.1"/>
<polygon points="340,70 430,15 510,70" fill="var(--secondary)" opacity="0.12"/>
<!-- LDS Temple (spires) -->
<rect x="55" y="55" width="45" height="73" fill="var(--primary)" opacity="0.7"/>
<rect x="62" y="35" width="8" height="22" fill="var(--secondary)"/>
<rect x="74" y="42" width="6" height="15" fill="var(--secondary)" opacity="0.8"/>
<rect x="85" y="35" width="8" height="22" fill="var(--secondary)"/>
<!-- 111 Main (tallest office) -->
<rect x="118" y="18" width="26" height="110" fill="var(--primary)"/>
<rect x="122" y="14" width="18" height="7" fill="var(--primary)"/>
<!-- Downtown cluster -->
<rect x="155" y="28" width="25" height="100" fill="var(--primary)" opacity="0.9"/>
<rect x="190" y="38" width="28" height="90" fill="var(--primary)" opacity="0.85"/>
<rect x="228" y="32" width="24" height="96" fill="var(--primary)" opacity="0.8"/>
<rect x="262" y="42" width="28" height="86" fill="var(--primary)" opacity="0.75"/>
<!-- Right fill -->
<rect x="302" y="35" width="26" height="93" fill="var(--primary)" opacity="0.7"/>
<rect x="340" y="48" width="28" height="80" fill="var(--primary)" opacity="0.65"/>
<rect x="380" y="42" width="30" height="86" fill="var(--primary)" opacity="0.6"/>
<rect x="422" y="55" width="26" height="73" fill="var(--primary)" opacity="0.5"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Sacramento

```svg
<!-- California State Capitol dome -->
<rect x="48" y="55" width="50" height="73" fill="var(--primary)" opacity="0.6"/>
<ellipse cx="73" cy="55" rx="25" ry="10" fill="var(--secondary)" opacity="0.7"/>
<rect x="69" y="35" width="8" height="22" fill="var(--secondary)"/>
<!-- Downtown cluster -->
<rect x="115" y="30" width="26" height="98" fill="var(--primary)"/>
<rect x="151" y="38" width="28" height="90" fill="var(--primary)" opacity="0.9"/>
<rect x="189" y="25" width="25" height="103" fill="var(--primary)" opacity="0.85"/>
<rect x="224" y="40" width="28" height="88" fill="var(--primary)" opacity="0.8"/>
<rect x="262" y="32" width="26" height="96" fill="var(--secondary)" opacity="0.8"/>
<!-- Right fill -->
<rect x="300" y="42" width="28" height="86" fill="var(--primary)" opacity="0.75"/>
<rect x="340" y="35" width="26" height="93" fill="var(--primary)" opacity="0.7"/>
<rect x="378" y="48" width="28" height="80" fill="var(--primary)" opacity="0.65"/>
<rect x="418" y="42" width="30" height="86" fill="var(--primary)" opacity="0.6"/>
<rect x="460" y="55" width="26" height="73" fill="var(--primary)" opacity="0.5"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```

## Generic Fallback (use only when city is unknown or unrecognizable)

If the agent's city is not in this file AND Claude cannot confidently build a recognizable skyline from its own knowledge of that city's landmarks, use this generic mid-size city silhouette — and add a note in the closing section: "City skyline illustration is approximate — update with your actual skyline in Canva."

```svg
<!-- Generic mid-rise city silhouette — neutral, non-specific -->
<rect x="30" y="60" width="28" height="68" fill="var(--primary)" opacity="0.5"/>
<rect x="68" y="45" width="22" height="83" fill="var(--primary)" opacity="0.7"/>
<rect x="100" y="30" width="30" height="98" fill="var(--primary)"/>
<rect x="140" y="50" width="25" height="78" fill="var(--secondary)" opacity="0.8"/>
<rect x="175" y="35" width="28" height="93" fill="var(--primary)" opacity="0.9"/>
<rect x="213" y="55" width="24" height="73" fill="var(--primary)" opacity="0.65"/>
<rect x="247" y="25" width="32" height="103" fill="var(--secondary)" opacity="0.75"/>
<rect x="289" y="42" width="26" height="86" fill="var(--primary)" opacity="0.8"/>
<rect x="325" y="58" width="28" height="70" fill="var(--primary)" opacity="0.6"/>
<rect x="363" y="38" width="30" height="90" fill="var(--primary)" opacity="0.85"/>
<rect x="403" y="48" width="24" height="80" fill="var(--secondary)" opacity="0.7"/>
<rect x="437" y="32" width="28" height="96" fill="var(--primary)" opacity="0.9"/>
<rect x="475" y="55" width="25" height="73" fill="var(--primary)" opacity="0.5"/>
<line x1="0" y1="128" x2="500" y2="128" stroke="var(--secondary)" stroke-width="2"/>
```
