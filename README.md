# kube-scan
Kubernetes Scanner

Requirements:
---

```
sudo apt-get install masscan jq curl -y
```



How to run:

---

```
./kube.sh 192.168.1.0/24
```

About
---

This will scan an IP or CIDR you supply for kubernetes port 10250 and try and obtain /pods to dump the json to a json file in the cfg folder.

You will see errors during the testing time but this is to be expected due to bad responses / invalid json.



Use at your own risk.
