# Intrusion Detection System (IDS) Configuration
## Suricata IDS Setup Guide

### تكوين نظام كشف الاختراقات لمنصة Talentos Professional

---

## 1. التثبيت

### على Ubuntu/Debian:

```bash
# تحديث النظام
sudo apt-get update
sudo apt-get upgrade -y

# تثبيت Suricata
sudo apt-get install -y suricata

# تثبيت أدوات إضافية
sudo apt-get install -y suricata-update

# التحقق من التثبيت
suricata --version
```

### على CentOS/RHEL:

```bash
# تثبيت من EPEL
sudo yum install -y epel-release
sudo yum install -y suricata

# التحقق من التثبيت
suricata --version
```

---

## 2. التكوين الأساسي

### ملف التكوين: `/etc/suricata/suricata.yaml`

```yaml
# Suricata Configuration
%YAML 1.1
---

# Logging configuration
logging:
  default-log-level: notice
  
  # Console output
  - console:
      enabled: true
      level: info
  
  # File output
  - file:
      enabled: true
      filename: /var/log/suricata/suricata.log
      level: info
  
  # EVE (Extensible Event Format) output
  - eve-log:
      enabled: true
      filename: /var/log/suricata/eve.json
      types:
        - alert
        - http
        - dns
        - tls
        - fileinfo
        - flow

# Threat detection
threat-detection:
  enabled: true

# Network configuration
vars:
  address-groups:
    HOME_NET: "[192.168.0.0/16,10.0.0.0/8,172.16.0.0/12]"
    EXTERNAL_NET: "!$HOME_NET"
    HTTP_PORTS: "80"
    HTTPS_PORTS: "443"
    SSH_PORTS: "22"

# Rules configuration
rule-files:
  - suricata.rules
  - emerging-threats.rules
  - local.rules

# Detection engine
detect-engine:
  - rule-reload: true
    rule-reload-interval: 60

# Performance tuning
threading:
  set-cpu-affinity: no
  cpu-affinity:
    - management-cpu-set:
        cpu: [ 0 ]
    - receive-cpu-set:
        cpu: [ 0 ]
    - decode-cpu-set:
        cpu: [ 0, 1 ]
    - stream-cpu-set:
        cpu: [ "0-3" ]
    - detect-cpu-set:
        cpu: [ "0-7" ]
    - output-cpu-set:
        cpu: [ 8 ]
    - verdict-cpu-set:
        cpu: [ 8 ]
```

---

## 3. تحديث القواعل

### تحديث قواعل Emerging Threats:

```bash
# تحديث القواعل
sudo suricata-update

# تحديث مع تفاصيل
sudo suricata-update -v

# تحديث مع قائمة محددة
sudo suricata-update list-sources
sudo suricata-update enable-source et/open
```

### قواعل موصى بها:

```bash
# تفعيل قواعل الأمان الأساسية
sudo suricata-update enable-source et/open
sudo suricata-update enable-source ptresearch/attackdetection
sudo suricata-update enable-source abuse/urlhaus

# تحديث القواعل
sudo suricata-update
```

---

## 4. إنشاء قواعل مخصصة

### ملف القواعل المخصصة: `/etc/suricata/rules/local.rules`

```
# SQL Injection Detection
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"SQL Injection Attempt"; flow:established,to_server; content:"union"; http_uri; sid:1000001; rev:1;)
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"SQL Injection - SELECT"; flow:established,to_server; content:"select"; http_uri; sid:1000002; rev:1;)
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"SQL Injection - DROP"; flow:established,to_server; content:"drop"; http_uri; sid:1000003; rev:1;)

# XSS Detection
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"XSS Attempt - Script Tag"; flow:established,to_server; content:"<script"; http_uri; sid:1000004; rev:1;)
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"XSS Attempt - Event Handler"; flow:established,to_server; content:"onerror="; http_uri; sid:1000005; rev:1;)
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"XSS Attempt - OnClick"; flow:established,to_server; content:"onclick="; http_uri; sid:1000006; rev:1;)

# DDoS Detection
alert tcp $EXTERNAL_NET any -> $HOME_NET any (msg:"Possible DDoS - High Connection Rate"; flow:new; threshold:type both, track by_dst, count 100, seconds 60; sid:1000007; rev:1;)

# Brute Force Detection
alert http $EXTERNAL_NET any -> $HOME_NET 443 (msg:"Brute Force - Multiple Failed Logins"; flow:established,to_server; content:"/api/oauth/callback"; http_uri; threshold:type both, track by_src, count 5, seconds 60; sid:1000008; rev:1;)

# Suspicious File Upload
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"Suspicious File Upload - Executable"; flow:established,to_server; content:".exe"; http_uri; sid:1000009; rev:1;)
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"Suspicious File Upload - Shell"; flow:established,to_server; content:".sh"; http_uri; sid:1000010; rev:1;)

# Path Traversal Detection
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"Path Traversal Attempt"; flow:established,to_server; content:"../"; http_uri; sid:1000011; rev:1;)

# Command Injection Detection
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"Command Injection - Semicolon"; flow:established,to_server; content:";"; http_uri; sid:1000012; rev:1;)
alert http $EXTERNAL_NET any -> $HOME_NET any (msg:"Command Injection - Pipe"; flow:established,to_server; content:"|"; http_uri; sid:1000013; rev:1;)
```

---

## 5. تشغيل Suricata

### تشغيل الخدمة:

```bash
# بدء الخدمة
sudo systemctl start suricata

# تفعيل الخدمة عند الإقلاع
sudo systemctl enable suricata

# التحقق من الحالة
sudo systemctl status suricata
```

### تشغيل في وضع الاختبار:

```bash
# اختبار التكوين
sudo suricata -c /etc/suricata/suricata.yaml -T

# تشغيل في وضع الاختبار
sudo suricata -c /etc/suricata/suricata.yaml -r /path/to/pcap/file.pcap
```

---

## 6. المراقبة والسجلات

### عرض السجلات:

```bash
# عرض السجلات الحية
sudo tail -f /var/log/suricata/suricata.log

# عرض أحداث EVE
sudo tail -f /var/log/suricata/eve.json | jq .

# عرض الأحداث الأخيرة
sudo tail -n 100 /var/log/suricata/eve.json
```

### تحليل السجلات:

```bash
# عد الأحداث
sudo grep "alert" /var/log/suricata/suricata.log | wc -l

# عرض أنواع الأحداث
sudo grep "msg:" /var/log/suricata/suricata.log | sort | uniq -c

# عرض أكثر IPs هجومية
sudo jq -r '.src_ip' /var/log/suricata/eve.json | sort | uniq -c | sort -rn | head -10
```

---

## 7. التكامل مع أنظمة المراقبة

### تكامل مع ELK Stack:

```yaml
# Filebeat configuration
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/suricata/eve.json
  json.message_key: message
  json.keys_under_root: true

output.elasticsearch:
  hosts: ["localhost:9200"]
  index: "suricata-%{+yyyy.MM.dd}"
```

### تكامل مع Splunk:

```
[suricata]
disabled = 0
index = suricata
sourcetype = suricata
source = /var/log/suricata/eve.json
```

---

## 8. التنبيهات والإجراءات

### إعداد التنبيهات:

```bash
# إرسال تنبيهات عبر البريد الإلكتروني
sudo apt-get install -y mailutils

# إنشاء سكريبت للتنبيهات
cat > /usr/local/bin/suricata-alert.sh << 'EOF'
#!/bin/bash
ALERT_COUNT=$(grep "alert" /var/log/suricata/suricata.log | wc -l)
if [ $ALERT_COUNT -gt 100 ]; then
  echo "تنبيه: تم اكتشاف $ALERT_COUNT أحداث مريبة" | mail -s "تنبيه أمني Suricata" admin@example.com
fi
EOF

chmod +x /usr/local/bin/suricata-alert.sh
```

---

## 9. الصيانة والتحديثات

### تحديث منتظم:

```bash
# تحديث القواعل يومياً
0 2 * * * /usr/bin/suricata-update

# تنظيف السجلات القديمة
0 3 * * * find /var/log/suricata -name "*.log" -mtime +30 -delete
```

---

## 10. استكشاف الأخطاء

### مشاكل شائعة:

```bash
# مشكلة: Suricata لا يبدأ
sudo suricata -c /etc/suricata/suricata.yaml -T

# مشكلة: أداء منخفض
sudo systemctl stop suricata
sudo suricata -c /etc/suricata/suricata.yaml -r /path/to/pcap/file.pcap

# مشكلة: قواعل لا تعمل
sudo suricata-update list-sources
sudo suricata-update enable-source et/open
```

---

**تم إعداد الدليل بواسطة**: فريق الأمان - Manus AI
**التاريخ**: 2026-06-07
