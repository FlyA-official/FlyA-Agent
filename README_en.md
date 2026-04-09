<div align="center">
  <img src="icon.png" width="120" />
  <h1>FlyA Agent</h1>
  <p>A Japanese Riichi Mahjong AI Desktop Application Powered by FlyA AI</p>
  <p>
    <a href="README.md">简体中文</a> | <a href="README_zh-TW.md">繁體中文</a> | <strong>English</strong> | <a href="README_ja.md">日本語</a>
  </p>
</div>

---

## Origin

This is a brand-new Riichi Mahjong teaching software.

The idea came from wanting a tool that could truly teach me how to play mahjong. After looking at existing software and models on the market, I found significant shortcomings — tile efficiency calculators like helper, or model loaders like Akagi, can hardly serve as real teaching tools because you never know what the model is "thinking."

So I recruited a few teammates from my company, and together we embarked on the long road of neural networks (no turning back now).

![screenshot](screenshot.png)

## Introduction

**FlyA Agent** is a Japanese Riichi Mahjong AI desktop application powered by FlyA AI, combining real-time teaching, built-in games, and automation.

You can use it to connect to Mahjong Soul and other Riichi Mahjong platforms, watch AI recommendations in real time, and understand the AI's reasoning. You can also play against AI opponents in the built-in mahjong game. The FlyA model features explicit situational awareness outputs — you can see the AI's perceived threat level, push confidence, and the motivation behind each decision.

> **The current version is an early beta.** Bugs are expected. If this concerns you, we recommend not using your main ranked account.

## Download

Go to the [Releases](../../releases/latest) page to download the latest version:

| File | Description |
|------|-------------|
| `FlyA-Agent-*-win-x64-setup.exe` | Windows installer (recommended) |
| `FlyA-Agent-*-win-x64.zip` | Windows portable (no installation needed) |

**Requirements**: Windows 10/11 (x64), internet connection required (AI inference is cloud-based)

Built with statically compiled languages (Go / Rust) — no runtime or dependencies needed. If you encounter a situation requiring dependency installation, please report it.

## Quick Start

1. Install or extract, then launch **FlyA Agent**
2. Log in with a test key (see below)
3. Choose your game platform from the "Quick Start" card on the home page:
   - **Mahjong Soul (Web)**: Launches via the built-in fingerprint browser — no privacy concerns
   - **Desktop clients** (Mahjong Soul client, Ichiban-gai, etc.): Click "Start Proxy", grant admin permission, and the software will automatically install certificates and configure the virtual network adapter
   - You can also use **manual certificate installation + external proxy** — no admin permission needed

## Models & Login

The beta supports the following login methods:
- **Akagi OT2 Key**
- **Test keys** distributed periodically by us

> Explainability (threat perception, push confidence, motivation definitions) is a FlyA model feature. OT models do not support this, but still provide basic deterministic calculations like shanten count, safe tiles, and effective tiles.

## Supported Platforms

| Platform | Status |
|----------|--------|
| Mahjong Soul Web (all regions) | ✅ Supported |
| Mahjong Soul Client (all regions) | ✅ Supported |
| Ichiban-gai | ✅ Supported |
| Tenhou, Queji, etc. | 🔧 In progress |

The software supports **Simplified Chinese, Traditional Chinese, Japanese, and English**.

## Proxy & Permissions

The client proxy mode uses a proprietary proxy engine with a built-in virtual network adapter. Admin permission is required on first launch to:

- Install a trusted certificate
- Create a virtual network adapter

After the initial setup, the proxy runs in the background without further authorization. If you prefer, you can manually install the certificate and use your own proxy tool.

> ⚠️ The built-in proxy uses TUN mode and cannot run alongside other TUN-mode proxy tools (Clash, V2RayN, etc.). Please close them or switch to non-TUN mode (e.g., system proxy) before starting.

## HUD Note

The HUD overlay hides itself from screenshots by default (to prevent leaks during streaming/recording). To capture HUD screenshots for bug reports, enable screenshot visibility in Settings > HUD.

## Privacy & Security

- **Data safety**: The software does not tamper with any game data or upload your private information. We do not use player data for model training.
- **Ban risk**: All test accounts remain active. However, prolonged use of inhuman automated play may still result in bans. Please use responsibly.
- **Closed source**: To prevent abuse and protect users, the software remains closed-source and will not be made widely available for free. No code from similar software was used in development. The software itself isn't the core asset — I'm too lazy to add heavy protection that would hurt performance.
- **Antivirus**: The current version uses a standard build process, reducing false positives. Please report any false detections.

## Update Policy

Early versions may not receive frequent updates — our model architecture has undergone significant changes. The software currently uses a "bridge" approach with the model. Switching engines is essentially a full rewrite, so after releasing a usable version, updates will pause while we focus on adapting the new model.

## Contact

| Channel | Link |
|---------|------|
| Discord (FlyA Agent) | https://discord.gg/hUwMGczz |
| Discord (shinkuan's Akagi) | https://discord.gg/Z2wjXUK8bN |
| QQ Group | 1093245435 |

## Disclaimer

This software is intended solely for Riichi Mahjong education and learning purposes. We oppose using the software for inhuman automated play, rank boosting, or any form of abuse. Our goal is to build a product that truly serves Riichi Mahjong education — the software contains extensive teaching elements, and the model is trained on explainable motivational strategies. All consequences arising from the use of this software are the sole responsibility of the user.

---

This software is proprietary and closed-source. All rights reserved. See [LICENSE](LICENSE).
