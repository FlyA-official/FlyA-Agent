# FlyA Agent

[中文](#中文) | [繁體中文](#繁體中文) | [English](#english) | [日本語](#日本語)

---

# 中文

## 起源

这是一款全新的立直麻将教学软件。

这个项目的想法来源于我想要一款可以真正教我打麻将的软件。但看了市面上现有的软件和模型，我都觉得有很大的问题——像 helper 这种牌效计算器、或 Akagi 这种模型加载器，都很难起到真正的教学作用，因为你不知道模型在"想"什么。

于是我就从公司逮捕了几个小伙伴，一起踏上了神经网络这条不归路（逃

![screenshot](screenshot.png)

## 简介

**FlyA Agent** 是一款基于 FlyA AI 的日本麻将智能体桌面软件，集实时教学、内置对局、自动化操作于一体。

您可以使用它接入雀魂等立直麻将游戏，观看 AI 实时的推荐以及 AI 的思路；也可以使用软件内置的麻将游戏与 AI 对弈。FlyA 模型拥有显式的场况感知输出——您可以看到 AI 认为的威胁程度、推进信心，以及 AI 对每个决策的动机定义。

> **当前版本为早期测试版**，Bug 肯定是有的。如果介意，不建议用上分心切的大号体验。

## 下载安装

前往 [Releases](../../releases/latest) 页面下载最新版本：

| 文件 | 说明 |
|------|------|
| `FlyA-Agent-*-win-x64-setup.exe` | Windows 安装包（推荐） |
| `FlyA-Agent-*-win-x64.zip` | Windows 便携版（免安装，解压即用） |

**系统要求**：Windows 10/11 (x64)，需联网（AI 推理为云端服务）

软件使用静态编译语言（Go / Rust）开发，无需安装任何运行时或依赖。若您遇到需要安装依赖的情况，请向我们报告。

## 快速上手

1. 安装或解压后，启动 **FlyA Agent**
2. 使用测试 Key 登录（见下方说明）
3. 在主页「快速开始」卡片中选择游戏平台：
   - **雀魂网页版**：通过软件内置的指纹浏览器启动，无需担心隐私泄露
   - **客户端版**（雀魂客户端、一番街等）：点击「启动代理」，授予管理员权限后，软件将自动完成证书安装与虚拟网卡配置
   - 也可选择**手动安装证书 + 外置代理**方式接入，无需管理员权限

## 关于模型与登录

测试版软件支持以下登录方式：
- **Akagi OT2 Key** 登录
- 我们**不定期发放的测试 Key** 登录

> 可解释性（威胁感知、推进信心、动机定义）是 FlyA 模型的特性，OT 模型不支持此功能，但仍提供基础的向听数、安全牌、有效牌等确定性计算。

## 支持平台

| 平台 | 状态 |
|------|------|
| 雀魂网页版（全区服） | ✅ 已支持 |
| 雀魂客户端（全区服） | ✅ 已支持 |
| 麻雀一番街 | ✅ 已支持 |
| 天凤、雀姬等 | 🔧 适配中 |

软件支持**简体中文、繁体中文、日本語、English** 四种语言。

## 代理与权限

软件的客户端代理模式采用 MITM 方式，通过内置虚拟网卡进行流量代理。首次启动时需授予管理员权限，以完成：

- 安装信任证书
- 创建虚拟网卡

授权一次后，代理服务以后台方式运行，后续无需再次授权。如不放心，可选择手动安装证书并使用自己的代理工具。

> ⚠️ 内置代理使用虚拟网卡（TUN 模式）进行流量接管，无法与 Clash、V2RayN 等同样使用 TUN 模式的代理软件同时运行。请先将其关闭或切换为非 TUN 模式（如系统代理模式）。

## HUD 提示

HUD 浮窗默认关闭了截图可见性（防止直播/录屏时泄露）。如需截图报告 Bug，请前往「设置 > HUD」开启截图可见性。

## 隐私与安全

- **数据安全**：软件不会篡改任何游戏数据，不会私自上传您的隐私信息。我们也无需通过玩家数据进行模型训练。
- **封号风险**：软件测试账号目前全部存活。但长时间使用非人类操作模式挂机连打，仍有被封号的可能，请合理使用。
- **闭源策略**：为防止滥用并保护用户安全，软件长期闭源，不会大规模免费开放。软件未使用任何同类软件源码进行二次开发。当然软件本体并不是核心，我也懒得为了这点权益去加太重的壳影响软件性能。
- **杀毒软件**：当前版本采用常规构建流程，降低了误报概率。如仍遇到误报，请向我们报告。

## 关于更新

早期版本可能不再频繁更新——我们的模型架构发生了较大变化，目前软件以"桥接"形式使用模型。引擎更换几乎相当于重构整个链路，所以发布差不多能用的版本后，将停更一段时间，全力适配新模型。

## 联系方式

| 渠道 | 链接 |
|------|------|
| Discord（FlyA Agent） | https://discord.gg/hUwMGczz |
| Discord（shinkuan's Akagi） | https://discord.gg/Z2wjXUK8bN |
| QQ 群 | 1093245435 |

## 免责声明

本软件仅供立直麻将教学与学习交流使用。我们反对利用软件进行非人类挂机连打、刷分等滥用行为。我们的初衷是构建一款真正服务于立直麻将教学的产品——软件包含大量教学元素，模型基于可解释的动机策略进行训练。使用本软件产生的一切后果由用户自行承担。

---

# 繁體中文

## 起源

這是一款全新的立直麻將教學軟體。

這個專案的想法來源於我想要一款可以真正教我打麻將的軟體。但看了市面上現有的軟體和模型，我都覺得有很大的問題——像 helper 這種牌效計算器、或 Akagi 這種模型加載器，都很難起到真正的教學作用，因為你不知道模型在「想」什麼。

於是我就從公司逮捕了幾個小夥伴，一起踏上了神經網路這條不歸路（逃

![screenshot](screenshot.png)

## 簡介

**FlyA Agent** 是一款基於 FlyA AI 的日本麻將智慧體桌面軟體，集即時教學、內建對局、自動化操作於一體。

您可以使用它接入雀魂等立直麻將遊戲，觀看 AI 即時的推薦以及 AI 的思路；也可以使用軟體內建的麻將遊戲與 AI 對弈。FlyA 模型擁有顯式的場況感知輸出——您可以看到 AI 認為的威脅程度、推進信心，以及 AI 對每個決策的動機定義。

> **當前版本為早期測試版**，Bug 肯定是有的。如果介意，不建議用上分心切的大號體驗。

## 下載安裝

前往 [Releases](../../releases/latest) 頁面下載最新版本：

| 檔案 | 說明 |
|------|------|
| `FlyA-Agent-*-win-x64-setup.exe` | Windows 安裝包（推薦） |
| `FlyA-Agent-*-win-x64.zip` | Windows 攜帶版（免安裝，解壓即用） |

**系統需求**：Windows 10/11 (x64)，需連網（AI 推理為雲端服務）

軟體使用靜態編譯語言（Go / Rust）開發，無需安裝任何執行環境或依賴。若您遇到需要安裝依賴的情況，請向我們回報。

## 快速上手

1. 安裝或解壓後，啟動 **FlyA Agent**
2. 使用測試 Key 登入（見下方說明）
3. 在主頁「快速開始」卡片中選擇遊戲平台：
   - **雀魂網頁版**：透過軟體內建的指紋瀏覽器啟動，無需擔心隱私洩露
   - **客戶端版**（雀魂客戶端、一番街等）：點擊「啟動代理」，授予管理員權限後，軟體將自動完成憑證安裝與虛擬網路卡配置
   - 也可選擇**手動安裝憑證 + 外部代理**方式接入，無需管理員權限

## 關於模型與登入

測試版軟體支援以下登入方式：
- **Akagi OT2 Key** 登入
- 我們**不定期發放的測試 Key** 登入

> 可解釋性（威脅感知、推進信心、動機定義）是 FlyA 模型的特性，OT 模型不支援此功能，但仍提供基礎的向聽數、安全牌、有效牌等確定性計算。

## 支援平台

| 平台 | 狀態 |
|------|------|
| 雀魂網頁版（全區服） | ✅ 已支援 |
| 雀魂客戶端（全區服） | ✅ 已支援 |
| 麻雀一番街 | ✅ 已支援 |
| 天鳳、雀姬等 | 🔧 適配中 |

軟體支援**簡體中文、繁體中文、日本語、English** 四種語言。

## 代理與權限

軟體的客戶端代理模式採用 MITM 方式，透過內建虛擬網路卡進行流量代理。首次啟動時需授予管理員權限，以完成：

- 安裝信任憑證
- 建立虛擬網路卡

授權一次後，代理服務以背景方式執行，後續無需再次授權。如不放心，可選擇手動安裝憑證並使用自己的代理工具。

> ⚠️ 內建代理使用虛擬網路卡（TUN 模式）進行流量接管，無法與 Clash、V2RayN 等同樣使用 TUN 模式的代理軟體同時執行。請先將其關閉或切換為非 TUN 模式（如系統代理模式）。

## HUD 提示

HUD 浮窗預設關閉了截圖可見性（防止直播/錄影時洩露）。如需截圖回報 Bug，請前往「設定 > HUD」開啟截圖可見性。

## 隱私與安全

- **資料安全**：軟體不會竄改任何遊戲資料，不會私自上傳您的隱私資訊。我們也無需透過玩家資料進行模型訓練。
- **封號風險**：軟體測試帳號目前全部存活。但長時間使用非人類操作模式掛機連打，仍有被封號的可能，請合理使用。
- **閉源策略**：為防止濫用並保護用戶安全，軟體長期閉源，不會大規模免費開放。軟體未使用任何同類軟體原始碼進行二次開發。當然軟體本體並不是核心，我也懶得為了這點權益去加太重的殼影響軟體效能。
- **防毒軟體**：當前版本採用常規建構流程，降低了誤報機率。如仍遇到誤報，請向我們回報。

## 關於更新

早期版本可能不再頻繁更新——我們的模型架構發生了較大變化，目前軟體以「橋接」形式使用模型。引擎更換幾乎相當於重構整個鏈路，所以發佈差不多能用的版本後，將停更一段時間，全力適配新模型。

## 聯絡方式

| 管道 | 連結 |
|------|------|
| Discord（FlyA Agent） | https://discord.gg/hUwMGczz |
| Discord（shinkuan's Akagi） | https://discord.gg/Z2wjXUK8bN |
| QQ 群 | 1093245435 |

## 免責聲明

本軟體僅供立直麻將教學與學習交流使用。我們反對利用軟體進行非人類掛機連打、刷分等濫用行為。我們的初衷是建構一款真正服務於立直麻將教學的產品——軟體包含大量教學元素，模型基於可解釋的動機策略進行訓練。使用本軟體產生的一切後果由使用者自行承擔。

---

# English

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

The client proxy mode uses MITM via a built-in virtual network adapter. Admin permission is required on first launch to:

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

# 日本語

## 誕生の経緯

これは全く新しいリーチ麻雀教育ソフトウェアです。

このプロジェクトのきっかけは、本当に麻雀を教えてくれるソフトが欲しかったことでした。市場にある既存のソフトやモデルを見ましたが、どれも大きな問題があると感じました——helper のような牌効率計算機や、Akagi のようなモデルローダーでは、モデルが何を「考えている」のか分からないため、本当の教育効果を得ることは困難です。

そこで、会社から仲間を何人か「逮捕」して、一緒にニューラルネットワークという片道切符の旅に出ました（笑）

![screenshot](screenshot.png)

## 概要

**FlyA Agent** は FlyA AI を搭載した日本リーチ麻雀 AI デスクトップソフトウェアです。リアルタイム教育、内蔵対局、自動化操作を統合しています。

雀魂などのリーチ麻雀ゲームに接続し、AI のリアルタイム推奨と思考過程を見ることができます。また、内蔵の麻雀ゲームで AI と対局することも可能です。FlyA モデルは明示的な場況認識出力を備えており、AI が判断する脅威度、推進への自信度、そして各決定の動機定義を確認できます。

> **現在のバージョンは早期テスト版です。** バグは必ずあります。気になる方は、昇段を気にするメインアカウントでの使用はお控えください。

## ダウンロード

[Releases](../../releases/latest) ページから最新版をダウンロードしてください：

| ファイル | 説明 |
|----------|------|
| `FlyA-Agent-*-win-x64-setup.exe` | Windows インストーラー（推奨） |
| `FlyA-Agent-*-win-x64.zip` | Windows ポータブル版（インストール不要） |

**動作環境**：Windows 10/11 (x64)、インターネット接続必須（AI 推論はクラウドサービス）

静的コンパイル言語（Go / Rust）で開発されており、ランタイムや依存関係のインストールは不要です。依存関係のインストールが必要な状況に遭遇した場合は、ご報告ください。

## クイックスタート

1. インストールまたは解凍後、**FlyA Agent** を起動
2. テストキーでログイン（下記参照）
3. ホーム画面の「クイックスタート」カードからゲームプラットフォームを選択：
   - **雀魂 Web 版**：内蔵フィンガープリントブラウザで起動、プライバシーの心配不要
   - **クライアント版**（雀魂クライアント、一番街など）：「プロキシ開始」をクリック、管理者権限を付与すると、証明書のインストールと仮想ネットワークアダプタの設定が自動完了
   - **手動証明書インストール + 外部プロキシ**方式も選択可能（管理者権限不要）

## モデルとログイン

テスト版は以下のログイン方法に対応しています：
- **Akagi OT2 Key** によるログイン
- 不定期に配布される**テストキー**によるログイン

> 説明可能性（脅威認識・推進自信度・動機定義）は FlyA モデルの特徴です。OT モデルはこの機能に対応していませんが、向聴数・安全牌・有効牌などの基本的な確定計算は利用可能です。

## 対応プラットフォーム

| プラットフォーム | 状態 |
|------------------|------|
| 雀魂 Web 版（全リージョン） | ✅ 対応済み |
| 雀魂クライアント（全リージョン） | ✅ 対応済み |
| 麻雀一番街 | ✅ 対応済み |
| 天鳳、雀姫など | 🔧 対応中 |

ソフトウェアは**簡体中国語、繁体中国語、日本語、English** の 4 言語に対応しています。

## プロキシと権限

クライアントプロキシモードは、内蔵仮想ネットワークアダプタを使用した MITM 方式で動作します。初回起動時に管理者権限が必要です：

- 信頼済み証明書のインストール
- 仮想ネットワークアダプタの作成

初回認証後、プロキシはバックグラウンドで動作し、以降の認証は不要です。ご不安な場合は、手動で証明書をインストールし、お好みのプロキシツールをお使いください。

> ⚠️ 内蔵プロキシは TUN モードを使用するため、Clash や V2RayN などの同様に TUN モードを使用するプロキシソフトとは同時に実行できません。事前にそれらを終了するか、非 TUN モード（システムプロキシなど）に切り替えてください。

## HUD について

HUD オーバーレイはデフォルトでスクリーンショットに映らない設定です（配信・録画時の漏洩防止）。HUD のバグ報告用にスクリーンショットが必要な場合は、設定 > HUD からスクリーンショット表示を有効にしてください。

## プライバシーとセキュリティ

- **データ安全性**：ソフトウェアはゲームデータの改ざんやプライバシー情報の無断アップロードを行いません。プレイヤーデータをモデル訓練に使用することもありません。
- **BAN リスク**：テストアカウントは現在すべて無事です。ただし、長時間にわたる非人間的な自動操作は BAN の可能性があります。適切にご利用ください。
- **クローズドソース**：悪用防止とユーザー保護のため、ソフトウェアは長期的にクローズドソースとし、大規模な無料公開は行いません。同種ソフトウェアのソースコードは一切使用していません。ソフトウェア自体はコアではないので、性能に影響するような重いプロテクトをかける気もありません。
- **ウイルス対策ソフト**：現行バージョンは標準的なビルドプロセスを採用し、誤検知の確率を低減しています。誤検知が発生した場合はご報告ください。

## アップデートについて

初期バージョンは頻繁に更新されない可能性があります。モデルアーキテクチャに大きな変更があり、現在ソフトウェアは「ブリッジ」方式でモデルを使用しています。エンジンの変更はほぼ全リンクの再構築に相当するため、使用可能なバージョンをリリースした後、一時的に更新を停止し、新モデルへの対応に専念します。

## お問い合わせ

| チャンネル | リンク |
|------------|--------|
| Discord（FlyA Agent） | https://discord.gg/hUwMGczz |
| Discord（shinkuan's Akagi） | https://discord.gg/Z2wjXUK8bN |
| QQ グループ | 1093245435 |

## 免責事項

本ソフトウェアはリーチ麻雀の教育および学習交流のみを目的としています。非人間的な自動連打、レート上げなどの悪用行為に反対します。私たちの目標は、リーチ麻雀教育に真に貢献する製品を構築することです。ソフトウェアには多くの教育要素が含まれ、モデルは説明可能な動機戦略に基づいて訓練されています。本ソフトウェアの使用により生じるすべての結果は、ユーザー自身の責任となります。

---

## License

This software is proprietary and closed-source. All rights reserved. See [LICENSE](LICENSE).
