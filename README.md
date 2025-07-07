## ✅ Mandatory VM Monitoring Metrics (For GitHub / Markdown Editors)

These are the **core metrics** every production-grade dashboard should track. They cover **availability**, **performance**, **security**, and **CI visibility**.

| **Category**           | **Metric Name**                     | **Description**                                                      | **Recommended Panel Type**         |
|------------------------|--------------------------------------|----------------------------------------------------------------------|-------------------------------------|
| **1. Availability & Health** |
| VM Health Status        | Up/Down status based on ping/agent  | Know which VMs are unreachable or failed                             | Table / Pie Chart                   |
| VM Uptime / Last Seen   | Last heartbeat timestamp            | Detect stale or crashed VMs                                          | Table                               |
| VM Reboot Events        | Last boot time                      | Spot unexpected reboots                                              | Table / Line Chart                  |

| **2. Performance**     |
| CPU Usage (%)           | Real-time and average usage          | Detect over/under-utilized VMs                                       | Line Chart                          |
| Memory Usage (%)        | Real-time memory usage               | Capacity monitoring                                                  | Line Chart                          |
| Disk Usage (%)          | Root and data volumes                | Prevent storage issues                                               | Line Chart / Table                  |
| Network I/O             | Traffic in and out per VM            | Useful for workload + attack detection                               | Line Chart                          |

| **3. Security**        |
| SSH Login Attempts      | Successful and failed logins         | Detect brute force or misuse                                         | Table / Bar Chart                   |
| Root SSH Access         | Detect logins using root             | Flags non-compliant access                                           | Table                               |
| Agent Status            | Is monitoring/logging agent running? | Ensures observability is active on each VM                           | Single Value / Table                |

| **4. Inventory & CI**  |
| VM Metadata             | VM name, IP, owner, env, project     | Helps track ownership and purpose                                    | Static Table                        |
| VM Age                  | Time since provisioning              | Old VMs may need cleanup or upgrades                                 | Table / Line Chart                  |
| Environment Tag Check   | Missing or wrong env tags            | Ensure proper grouping (e.g., Kali, Dev, Prod)                       | Table / Flag Panel                  |

| **5. Kali Linux Specific** |
| Kali VM Status          | Online/offline status of pentest VMs | Ensure security lab visibility                                       | Table                               |
| Running Tools (Optional)| Detect tools like nmap, hydra        | Monitor active pentest operations                                    | Table / Logs (advanced)             |
