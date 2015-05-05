---
layout: page
title: Discription
date: 2015-05-04
repository: XXXX
---

# 2 ディスクリプション

<!--
Description is Step 2 in UPnP networking. Description comes after addressing (Step 0) where
devices get a network address, and after discovery (Step 1) where control points find
interesting device(s). Description enables control (Step 3) where control points send
commands to device(s), eventing (Step 4) where control points listen to state changes in
device(s), and presentation (Step 5) where control points may display an html user interface
for device(s).
-->

ディスクリプションはUPnPネットワーキングのステップ2である。
ディスクリプションは、デバイスがネットワークアドレスを取得するアドレッシング(ステップ0)と、コントロールポイントが興味のあるデバイスを検出するディスカバリ(ステップ1)の後に来る。
ディスクリプションは、コントロールポイントがデバイスにコマンドを送信するコントロール(ステップ3)と、コントロールポイントがデバイスの状態変化をリッスンするイベンティング(ステップ4)、
コントロールポイントがデバイスのHTMLユーザインタフェースを表示するプレゼンテーション(ステップ5)を可能にする。

<!--
After a control point has discovered a device, the control point still knows very little about the
device -- only the information that was in the discovery message, i.e., the device's (or
service's) UPnP type, the device's universally-unique identifier, and a URL to the device's
UPnP description. For the control point to learn more about the device and its capabilities, or
to interact with the device, the control point shall retrieve a description of the device and its
capabilities from the URL provided by the device in the discovery message.
-->

コントロールポイントがデバイスを発見した後でも、コントロールポイントはデバイスについてほとんど知らない。
ディスカバリメッセージ内の情報だけである。例えば、デバイス(またはサービス)のUPnPタイプ、デバイスのユニバーサルユニークID、そしてデバイスのUPnPのURL。
コントロールポイントがデバイスやその機能についてもっと知るため、もしくはデバイスとやりとりするため、コントロールポイントはデバイスやその機能のディスクリプションを、ディスカバリメッセージ内のデバイスによって与えられるURLから取得するものとする。

Figure 2-1: — Description architecture
図2-1: ディスクリプションアーキテクチャ

<!--
The UPnP description for a device is partitioned into two logical parts: a device description
describing the physical and logical containers, and service descriptions describing the
capabilities exposed by the device. A UPnP device description includes vendor-specific
manufacturer information like the model name and number, serial number, manufacturer
name, URLs to vendor-specific Web sites, etc. (details below). For each service included in
the device, the device description lists the service type, service name, a URL for a service
description, a URL for control, and a URL for eventing. A device description also includes a
description of all embedded devices and a URL for presentation of the aggregate. This clause
explains UPnP device descriptions, and the clauses on Control, Eventing, and Presentation
explain how URLs for control, eventing, and presentation are used respectively.
-->

デバイスのUPnPディスクリプションは、2つの論理パーツに分けられる:
デバイスディスクリプションは物理と論理コンテナについて記述し、サービスディスクリプションはデバイスによって提供される機能について記述する。
UPnPデバイスディスクリプションは、モデル名やナンバー、シリアルナンバー、製造名、ベンダ固有のWebサイトへのURL(下記に詳述)のような、ベンダ固有の製造情報を含む。
デバイス内のそれぞれのサービス毎に、デバイスディスクリプションはサービスタイプ、サービス名、サービスディスク類プションのためのURL、コントロールのためのURL、イベンティングのためのURLを記述する。
デバイスディスクリプションはまた、全ての埋め込みデバイスと、全体のプレゼンテーションのためのURLを含む。
本節は、UPnPデバイスディスクリプションについて説明し、またコントロール、イベンティング、そしてプレゼンテーションの節は、どのようにコントロール、イベンティング、プレゼンテーションのURLがそれぞれ使用されるか説明する。


<!--
Note that a single physical device is allowed to include multiple logical devices. Multiple
logical devices can be modeled as a single root device with embedded devices (and services)
or as multiple root devices (perhaps with no embedded devices). In the former case, there is
one UPnP device description for the root device, and that device description contains a
description for all embedded devices. In the latter case, there are multiple UPnP device
descriptions, one for each root device.
-->

ここで留意すべきは、一つの物理的なデバイスは、複数の論理デバイスを含むことができることである。
複数の論理デバイスは、埋め込みデバイス(とサービス)を伴う一つのルートデバイスか、もしくは複数のルートデバイス(埋め込みデバイスはない)で表される。
前者の場合、ルートデバイスのための一つのデバイスディスクリプションがあり、そのデバイスディスクリプションは全ての埋め込みデバイスのための説明を含んでいる。
後者の場合、各ルートデバイス毎に一つ、複数のUPnPデバイスディスクリプションがある。


<!--
A UPnP device description is written by a UPnP vendor. The description is in XML syntax and
is usually based on a standard UPnP Device Template. A UPnP Device Template is produced
by a UPnP Forum working committee; they derive the template from the UPnP Device
Schema, which was derived from standard constructions in XML. This clause explains the
format for a UPnP device description, UPnP Device Templates, and the part of the UPnP
Device Schema that covers devices.
-->

UPnPデバイスディスクリプションはUPnPベンダによって書かれる。
ディスクリプションはXML構文で書かれ、通常は標準UPnPデバイステンプレートに基づいている。
UPnPデバイステンプレートはUPnPフォーラムワーキング委員会によって制作される;
それらはUPnPデバイススキーマのテンプレートから由来していて、それはXMLの標準構造から派生している。
本節はUPnPデバイスディスクリプションのフォーマット、UPnPデバイステンプレート、そしてデバイスで取り扱うUPnPデバイススキーマの一部について説明する。


<!--
A UPnP service description includes a list of commands, or actions, to which the service
responds, and parameters, or arguments for each action. A service description also includes a
list of variables. These variables model the state of the service at run time, and are described
in terms of their data type, range, and event characteristics. This clause explains the
description of actions, arguments, state variables, and the properties of those variables. The
clause on Eventing explains event characteristics.
-->

UPnPサービスディスクリプションは、コマンド、アクション、どのサービスが応答するか、パラメータ、もしくは各アクションの引数のリストを含んでいる。
サービスディスクリプションはまた、変数の一覧を含んでいる。
これらの変数は実行時のサービスの状態を荒らさ氏、データ型、値域、イベント特性に関して説明される。
本節はアクション、引数、状態変数、そしてこれらの変数のプロパティについて説明する。
イベンティングについての節ではイベント特性について説明する。

<!--
Like a UPnP device description, a UPnP service description is written by a UPnP vendor. The
description is in XML syntax and is usually based on a standard UPnP Service Template. A
UPnP Service Template is produced by a UPnP Forum working committee; they derived the
template from the UPnP Service Schema, augmenting it with human language where
necessary. The UPnP Service Schema is derived using the conventions of XML Schema. This
clause explains the format for a UPnP service description, UPnP Service Templates, typical
augmentations in human language, and the part of the UPnP Service Schema that covers
services.
-->

UPnPデバイスディスクリプションと同様に、UPnPサービスディスクリプションはUPnPベンダによって書かれる。
ディスクリプションはXML構文で書かれ、通常は標準UPnPサービステンプレートに基づいている。
UPnPサービステンプレートはUPnPフォーラムワーキング委員会によって制作される;
それらはUPnPサービススキーマのテンプレートから由来していて、必要に応じて人間の言語によって補完する。
UPnPサービススキーマはXMLスキーマの慣習に従って派生している。
本節はUPnPサービスディスクリプションのフォーマット、UPnPサービステンプレート、一般的な人間後による増補、そしてサービスで取り扱うUPnPサービススキーマの一部について説明する。


