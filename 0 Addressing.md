---
layout: page
title: Adressing
date: 2015-05-05
repository: XXXX
---

# 0 Adressing

<!-- 
Addressing is Step 0 of UPnP networking. Through addressing, devices and control points get a network address. Addressing enables discovery (Step 1) where control points find interesting device(s), description (Step 2) where control points learn about device capabilities, control (Step 3) where a control point sends commands to device(s), eventing (Step 4) where control points listen to state changes in device(s), and presentation (Step 5) where control points display a user interface for device(s).
 -->

アドレッシングはUPnPネットワーキングのステップ0である。
アドレッシングによって、デバイスとコントロールポイントはネットワークアドレスを取得する。
アドレッシングは、コントロールポイントが興味のあるデバイスを発見した場所でディスカバリを、コントロールポイントがデバイスの機能を知る場所でディスクリプションを、コントロールポイントがデバイスにコマンドを送信する場所でコントロールを、コントロールポイントがデバイスの状態変化をリッスンする場所でイベントを、コントロールポイントがデバイス用にユーザインタフェースを表示する場所でプレゼンテーションを可能にする。


<!-- The foundation for UPnP networking is IP addressing. A UPnP device or control point is allowed to support IP version 4-only, or both IP version 4 and IP version 6. This clause, and the examples given throughout clauses 1 through 5 of this document, assumes an IPv4 implementation. Annex A of this document describes IPv6 operation. Each UPnP device or control point which does not itself implement a DHCP server shall have a Dynamic Host Configuration Protocol (DHCP) client and search for a DHCP server when the device or control point is first connected to the network (if the device or control point itself implements a DHCP server, it allowed to allocate itself an address from the pool that it controls). If a DHCP server is available, i.e., the network is managed; the device or control point shall use the IP address assigned to it. If no DHCP server is available, i.e., the network is unmanaged; the device or control point shall use automatic IP addressing (Auto-IP) to obtain an address.
 -->

UPnPネットワーキングの基礎はIPアドレッシングである。
UPnPデバイスかコントロールポイントはIPv4のみか、IPv4とIPv6の両方をサポートすることを許可されている。
本節と、本ドキュメントの1〜5節にある例は、IPv4の実装を仮定している。
本ドキュメントの付録Aは、IPv6のオペレーションについて記載している。
DHCPサーバを実装していないUPnPデバイスとコントロールポイントは、 Dynamic Host
Configuration Protocol(DHCP)クライアントを持ち、デバイスかコントロールポイントが最初にネットワークに接続されたとき、DHCPサーバを探すものとする(もしデバイスかコントロールポイントがDHCPサーバを実装しているなら、それが保持しているプールからアドレスを割り当てることができる)。
もしDHCPサーバが使用できるなら、ネットワークが管理されている場合など、デバイスやコントロールポイントは割り当てられたIPアドレスを使用するものとする。
使用できるDHCPサーバがない場合は、ネットワークが管理されてない場合など、デバイスやコントロールポイントはアドレス取得のため自動IPアドレッシング(Auto-IP)を使用するものとする。

<!-- 
Auto-IP (defined in RFC 3927) defines how a device or control point: (a) determines if DHCP is unavailable, and (b) intelligently chooses an IP address from a set of link-local IP addresses. This method of address assignment enables a device or control point to easily move between managed and unmanaged networks.
 -->

Auto-IP(RFC 3927で定義)は、DHCPサーバが使用できないとき、デバイスやコントロールポイントが(a)どのようにIPアドレスを決め、(b)リンクローカルIPアドレスのセットから知的にIPアドレスを選択するかを定義している。
この方法のアドレス割当は、管理されたネットワークや管理されていないネットワークの間でもデバイスやコントロールポイントが容易に動くこと可能にする。

<!-- 
This clause provides an overview of the basic operation of Auto-IP. The operations described in this clause are detailed and clarified in the reference documents listed below. Where conflicts between this document and the reference documents exist, the reference document always takes precedence.
 -->

本節はAuto-IPの基本オペレーションの概要を説明する。
本節で説明するオペレーションは下部に記載するリファレンスドキュメントで詳細化、明確化される。
本ドキュメントとリファレンスドキュメントの間で不一致が存在するときは、リファレンスドキュメントの方を優先すべし。





## 0.1 Auto-IPを使うべきどうかの決定

<!-- 
A device or control point that supports Auto-IP and is configured for dynamic address assignment begins by requesting an IP address via DHCP by sending out a DHCPDISCOVER message. The amount of time this DHCP Client listens for DHCPOFFERs is implementation dependent. If a DHCPOFFER is received during this time, the device or control point shall continue the process of dynamic address assignment. If no valid DHCPOFFERs are received, the device or control point shall then auto-configure an IP address using Auto-IP.
 -->

Auto-IPをサポートし、動的アドレス割当のために設定されているデバイスやコントロールポイントは、
DHCPDISCOVERメッセージを送信することでDHCPを通してIPアドレスを要求する


## 0.2 アドレス選択

<!-- 
To auto-configure an IP address using Auto-IP, the device or control point uses an implementation dependent algorithm for choosing an address in the 169.254/16 range. The first and last 256 addresses in this range are reserved and shall NOT be used.
 -->

<!-- 
The selected address shall then be tested to determine if the address is already in use. If the address is in use by another device or control point, another address shall be chosen and tested, up to an implementation dependent number of retries. The address selection shall be randomized to avoid collision when multiple devices or control points are attempting to allocate addresses. The device or control point chooses an address using a pseudo-random algorithm (distributed over the entire address range from 169.254.1.0 to 169.254.254.255) to minimize the likelihood that devices or control points that join the network at the same time will choose the same address and subsequently choose alternative addresses in the same sequence when collisions are detected. This pseudo-random algorithm should be seeded using the device’s or control point’s Ethernet hardware MAC address.
 -->

## 0.3 アドレスのテスト

<!-- 
To test the chosen address, the device or control point shall use an Address Resolution Protocol (ARP) probe. An ARP probe is an ARP request with the device or control point hardware address used as the sender's hardware address and the sender's IP address set to 0s. The device or control point shall then listen for responses to the ARP probe, or other ARP probes for the same IP address. If either of these ARP packets is seen, the device or control point shall consider the address in use and try a different address. The ARP probe is allowed to be repeated for greater certainty that the address is not already in use; it is recommended that the probe be sent four times at two-second intervals.
 -->
<!-- 
After successfully configuring a link-local address, the device or control point shall send two gratuitous ARPs, spaced two seconds apart, this time filling in the sender IP address. The purpose of these gratuitous ARPs is to make sure that other hosts on the net do not have stale ARP cache entries left over from some other host that may previously have been using the same address.
 -->

<!-- 
Devices and control points that are equipped with persistent storage are allowed to record the IP address they have selected and on the next boot use that address as their first candidate when probing, in order to increase the stability of addresses and reduce the need to resolve address conflicts.
 -->

<!-- 
Address collision detection is not limited to the address testing phase, when the device or control point is sending ARP probes and listening for replies. Address collision detection is an ongoing process that is in effect for as long as the device or control point is using a link-local address. At any time, if a device or control point receives an ARP packet with its own IP address given as the sender IP address, but a sender hardware address that does not match its own hardware address, then the device or control point shall treat this as an address collision and shall respond as described in either a) or b) below:
 -->

<!-- 
a) Immediately configure a new link-local IP address as described above; or,
b) If the device or control point currently has active TCP connections or other reasons to prefer to keep the same IP address, and has not seen any other conflicting ARP packets recently (e.g., within the last ten seconds) then it is allowed to elect to attempt to defend its address once, by recording the time that the conflicting ARP packet was received, and then broadcasting one single gratuitous ARP, giving its own IP and hardware addresses as the source addresses of the ARP. However, if another conflicting ARP packet is received within a short time after that (e.g., within ten seconds) then the device or control point shall immediately configure a new Auto-IP address as described above.
 -->

<!-- 
The device or control point shall respond to conflicting ARP packets as described in either a) or b) above; it shall NOT ignore conflicting ARP packets. If a new address is selected, the device or control point shall cancel previous advertisements and re-advertise with the new address.
 -->

<!-- 
After successfully configuring an Auto-IP address, all subsequent ARP packets (replies as well as requests) containing an Auto-IP source address shall be sent using link-level broadcast instead of link-level unicast, in order to facilitate timely detection of duplicate addresses.
 -->

## 0.4 ルールの転送

<!-- 
IP packets whose source or destination addresses are in the 169.254/16 range shall NOT be sent to any router for forwarding. Instead, the senders shall ARP for the destination address and then send the packets directly to the destination on the same link. IP datagrams with a multicast destination address and an Auto-IP source address shall NOT be forwarded off the local link. Devices and control points are allowed to assume that all 169.254/16 destination addresses are on-link and directly reachable. The 169.254/16 address range shall not be subnetted.
 -->

## 0.5 動的アドレスが使用可能か定期的なチェック

<!-- 
A device or control point that has auto-configured an IP address shall periodically check for the existence of a DHCP server. This is accomplished by sending DHCPDISCOVER messages. How often this check is made is implementation dependent, but checking every 5 minutes would maintain a balance between network bandwidth required and connectivity maintenance. If a DHCPOFFER is received, the device or control point shall proceed with dynamic address allocation. Once a DHCP assigned address is in place, the device or control point is allowed to release the auto-configured address, but is also allowed to choose to maintain this address for a period of time (or indefinitely) to maintain connectivity.
 -->
<!-- 
To switch over from one IP address to a new one, the device should, if possible, cancel any outstanding advertisements made on the previous address and shall issue new advertisements on the new address. The clause on Discovery explains advertisements and their cancellations. In addition, any event subscriptions are deleted by the device (see clause on Eventing).
 -->

<!-- 
For a multi-homed device with multiple IP addresses, to switch one of the IP addresses to a new one, the device should cancel any outstanding advertisements made on the previous IP address, and shall issue new advertisements on the new IP addresses. Furthermore, it shall also issue appropriate update advertisements on all unaffected IP addresses. The clause on Discovery explains advertisements, their cancellations and updates. The clause on Eventing explains the effect on event subscriptions.
 -->


## 0.6 デバイスネーミングとDNSインタラクション

<!-- 
Once a device has a valid IP address for the network, it can be located and referenced on that network through that address. There may be situations where the end user needs to locate and identify a device. In these situations, a friendly name for the device is much easier for a human to use than an IP address. If a device chooses to provide a host name to a DHCP
server and register with a DNS server, the device should either ensure the requested host name is unique or provide a means for the user to change the requested host name. Most often, devices do not provide a host name, but provide URLs using literal (numeric) IP addresses.
 -->

<!-- 
Moreover, names are much more static than IP addresses. Clients referring a device by name don't require any modification when the IP address of a device changes. Mapping of the device's DNS name to its IP address could be entered into the DNS database manually or dynamically according to RFC 2136. While devices supporting dynamic DNS updates can register their DNS records directly in the DNS, it is also possible to configure a DHCP server to register DNS records on behalf of these DHCP clients.
 -->


## 0.7 IPアドレス解決の名前

<!-- 
A device that needs to contact another device identified by a DNS name needs to discover its IP address. The device submits a DNS query according to RFC1034 and 1035 to the pre-configured DNS server(s) and receives a response from a DNS server containing the IP address of the target device. A device can be statically pre-configured with the list of DNS servers. Alternatively a device could be configured with the list of DNS server through DHCP, or after the address assignment through a DHCPINFORM message.
 -->

## 0.8 リファレンス

RFC1034, Domain Names - Concepts and Facilities. 
http://www.ietf.org/rfc/rfc1034.txt.


RFC1035, Domain Names - Implementation and Specification.
http://www.ietf.org/rfc/rfc1035.txt.

RFC 2131, Dynamic Host Configuration Protocol. 
http://www.ietf.org/rfc/rfc2131.txt.

RFC 2136, Dynamic Updates in the Domain Name System. 
http://www.ietf.org/rfc/rfc2136.txt.

RFC 3927, Dynamic Configuration of IPv4 Link-Local Addresses. 
http://www.ietf.org/rfc/rfc3927.txt.


