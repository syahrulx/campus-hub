# CampusHub Server Management Guide

## 🔐 Server Access

**IP Address:** `134.209.111.165`  
**User:** `root`

### Connect to Server:

```bash
ssh root@134.209.111.165
```

---

## 🚀 Start/Stop Services

### GlassFish (Web Server):

```bash
# Start
~/glassfish5/bin/asadmin start-domain

# Stop
~/glassfish5/bin/asadmin stop-domain

# Restart
~/glassfish5/bin/asadmin restart-domain
```

### Derby (Database):

```bash
# Start (IMPORTANT: use --dbhome flag!)
~/glassfish5/bin/asadmin start-database --dbhome ~/.netbeans-derby

# Stop
~/glassfish5/bin/asadmin stop-database
```

---

## 🔄 Deploy New Code

**From your Mac:**

```bash
# 1. Build in NetBeans: Clean and Build

# 2. Upload WAR file
scp /Users/syahrul/Downloads/campushub/dist/campushub.war root@134.209.111.165:~/

# 3. SSH into server
ssh root@134.209.111.165

# 4. Deploy
cp ~/campushub.war ~/glassfish5/glassfish/domains/domain1/autodeploy/
```

---

## 🔌 SSH Tunnel (Access Live Database via GUI)

**Step 1:** Open tunnel (keep terminal open):

```bash
ssh -L 1527:localhost:1527 root@134.209.111.165
```

**Step 2:** In NetBeans:

- Services → Databases → New Connection
- Driver: Java DB (Network)
- Host: `localhost`
- Port: `1527`
- Database: `campus_db`
- User: `app`
- Password: `app`

Now you can browse/edit live data in NetBeans!

---

## 📊 View Database via Command Line

```bash
# On server
cd ~/glassfish5
java -jar javadb/lib/derbyrun.jar ij

# Then:
connect 'jdbc:derby://localhost:1527/campus_db;user=app;password=app';
SELECT * FROM APP.USERS;
exit;
```

---

## 📋 View Logs

```bash
# GlassFish logs
tail -f ~/glassfish5/glassfish/domains/domain1/logs/server.log

# Press Ctrl+C to stop
```

---

## 🔧 Quick Troubleshooting

| Problem             | Solution                                                              |
| ------------------- | --------------------------------------------------------------------- |
| Site not loading    | Start GlassFish: `~/glassfish5/bin/asadmin start-domain`              |
| Port 4848 in Use    | Kill process: `lsof -t -i:4848 \| xargs kill -9` then start domain    |
| DB connection error | Start Derby with: `asadmin start-database --dbhome ~/.netbeans-derby` |
| Can't SSH           | Check IP address, check internet                                      |
| Changes not showing | Re-deploy WAR file                                                    |

---

## 🌐 URLs

| What            | URL                                    |
| --------------- | -------------------------------------- |
| Website         | http://134.209.111.165:8080/campushub/ |
| GlassFish Admin | https://134.209.111.165:4848           |

---

## 💰 DigitalOcean

- Dashboard: https://cloud.digitalocean.com
- Your credits are being used monthly
- $12/month for your droplet
