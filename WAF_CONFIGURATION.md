# Web Application Firewall (WAF) Configuration
## Cloudflare WAF Setup Guide

### تكوين Cloudflare WAF لمنصة Talentos Professional

---

## 1. تفعيل Cloudflare WAF

### الخطوة 1: الدخول إلى لوحة التحكم
1. اذهب إلى https://dash.cloudflare.com
2. اختر النطاق: `talentmarket-hx5cm2yd.manus.space`
3. اضغط على **Security** > **WAF**

### الخطوة 2: تفعيل WAF
- اضغط على **Enable WAF**
- تأكد من أن WAF مفعل (يجب أن يظهر "Enabled")

---

## 2. تكوين قواعل الحماية

### OWASP ModSecurity Core Rule Set (CRS)

```
Security Level: High
- SQL Injection Protection: Enabled
- XSS Protection: Enabled
- Local File Inclusion (LFI): Enabled
- Remote File Inclusion (RFI): Enabled
- PHP Injection: Enabled
- Cross-site Scripting (XSS): Enabled
- Session Fixation: Enabled
- Scanner Detection: Enabled
- Trojan Protection: Enabled
- Backdoor Protection: Enabled
```

### خطوات التفعيل:

1. اذهب إلى **Security** > **WAF** > **Managed Rules**
2. اختر **OWASP ModSecurity Core Rule Set**
3. اضغط على **Enable**
4. اختر **High** من قائمة Sensitivity

---

## 3. تكوين Rate Limiting

### إعدادات Rate Limiting:

```
Rule 1: General Rate Limiting
- Threshold: 100 requests per 10 seconds per IP
- Action: Challenge (CAPTCHA)
- Duration: 15 minutes

Rule 2: API Rate Limiting
- Threshold: 50 requests per 10 seconds per IP
- Action: Block
- Duration: 1 hour

Rule 3: Login Attempts
- Threshold: 5 failed attempts per minute
- Action: Block
- Duration: 24 hours
```

### خطوات التكوين:

1. اذهب إلى **Security** > **Rate Limiting**
2. اضغط على **Create Rule**
3. أدخل الإعدادات أعلاه

---

## 4. تكوين قواعل مخصصة

### قاعدة 1: حماية من SQL Injection

```
Rule Name: Block SQL Injection Attempts
Expression: (cf.threat_score > 50) or (http.request.uri.query contains "union") or (http.request.body contains "select")
Action: Block
```

### قاعدة 2: حماية من XSS

```
Rule Name: Block XSS Attempts
Expression: (http.request.uri.query contains "<script>") or (http.request.body contains "onerror=") or (http.request.body contains "onclick=")
Action: Block
```

### قاعدة 3: حماية من DDoS

```
Rule Name: DDoS Protection
Expression: (cf.bot_management.score < 30)
Action: Challenge
```

---

## 5. تكوين الاستثناءات (Whitelist)

### إضافة IPs موثوقة:

1. اذهب إلى **Security** > **WAF** > **Firewall Rules**
2. اضغط على **Create Rule**
3. أدخل IP العنوان
4. اختر **Allow**

### مثال:

```
IP: 203.0.113.0/24 (مثال)
Action: Allow
```

---

## 6. المراقبة والتنبيهات

### إعداد التنبيهات:

1. اذهب إلى **Notifications**
2. اضغط على **Add Notification**
3. اختر **WAF Alert**
4. أدخل بريدك الإلكتروني

### المقاييس المراقبة:

- عدد الطلبات المحجوبة
- عدد محاولات SQL Injection
- عدد محاولات XSS
- عدد محاولات DDoS

---

## 7. الاختبار

### اختبار WAF:

```bash
# اختبار SQL Injection
curl "https://talentmarket-hx5cm2yd.manus.space/api/search?q=1' OR '1'='1"
# النتيجة المتوقعة: 403 Forbidden

# اختبار XSS
curl "https://talentmarket-hx5cm2yd.manus.space/api/search?q=<script>alert('XSS')</script>"
# النتيجة المتوقعة: 403 Forbidden
```

---

## 8. السجلات والتقارير

### عرض السجلات:

1. اذهب إلى **Analytics** > **Security**
2. اختر **WAF Events**
3. اعرض السجلات والإحصائيات

### التقارير:

- عدد الطلبات المحجوبة يومياً
- أكثر أنواع الهجمات شيوعاً
- أكثر IPs هجومية

---

## 9. الصيانة والتحديثات

### تحديث القواعل:

- تحديث OWASP CRS: أسبوعياً
- مراجعة القواعل المخصصة: شهرياً
- تحديث قائمة البيضاء: حسب الحاجة

---

## 10. الدعم والمساعدة

- **Cloudflare Support**: https://support.cloudflare.com
- **WAF Documentation**: https://developers.cloudflare.com/waf/
- **Community**: https://community.cloudflare.com

---

**تم إعداد الدليل بواسطة**: فريق الأمان - Manus AI
**التاريخ**: 2026-06-07
