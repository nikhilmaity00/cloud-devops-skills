# Cloud & DevOps Skills Repository

> Curated, production-grade AI agent skills and runbooks for Cloud, DevOps, Site Reliability Engineering (SRE), Networking, and Infrastructure automation — trimmed and adapted from [ECC (Everything Claude Code)](https://github.com/affaan-m/ECC.git).

---

## Overview

Modern AI coding agents (such as **Google Antigravity**, **Claude Code**, and **Cursor**) excel when guided by deterministic runbooks, structured checklists, and deep domain context.

While the upstream ECC project contains nearly 300 general-purpose skills (spanning mobile, frontend, social media, ecommerce, legal, etc.), this repository isolates and refines the **35 core skills and 9 specialized agents** strictly relevant to:

- 🐳 **Containers & Orchestration** (Docker, Kubernetes, lightweight clusters)
- 🚀 **CI/CD & Deployment Patterns** (Zero-downtime, blue-green, canary verification, release flow)
- 🔐 **Cloud & Infrastructure Security** (IAM least-privilege, secret management, config audits, safety guards)
- 🌐 **Networking, Systems & Homelab** (BGP, IOS/Cisco, SSH automation, WireGuard, Pi-hole, VLANs)
- 📈 **Observability, Reliability & SRE** (Grafana/SigNoz dashboards, p99 latency optimization, production audits)
- 🗄️ **Database & Persistence Ops** (PostgreSQL DBA, Redis distributed caching/locks, zero-downtime migrations)
- 🛡️ **Verification Gates** (Multi-stage test/lint/security verification loops, e2e smoke tests)

---

## Skill Catalog by Domain

### 1. Containers & Container Orchestration

| Skill | Description | Key Triggers |
| :--- | :--- | :--- |
| [`docker-patterns`](skills/docker-patterns/SKILL.md) | Multi-stage Dockerfiles, Docker Compose stacks, container security, volume management, health checks. | Dockerfile creation, compose setup, container hardening |
| [`kubernetes-patterns`](skills/kubernetes-patterns/SKILL.md) | Production K8s manifests, probes, RBAC, HPA, PDBs, ConfigMaps/Secrets, and `kubectl` debugging. | K8s deployments, services, ingress, CrashLoopBackOff triage |
| [`uncloud`](skills/uncloud/SKILL.md) | Lightweight container cluster orchestration with Caddy ingress and static proxy routes. | Uncloud clusters, lightweight container hosting |

---

### 2. CI/CD & Deployment Strategies

| Skill | Description | Key Triggers |
| :--- | :--- | :--- |
| [`deployment-patterns`](skills/deployment-patterns/SKILL.md) | Production deployment strategies: rolling, blue-green, canary, rollback plans, and health check probes. | CI/CD design, deploy strategy selection, zero-downtime rollout |
| [`canary-watch`](skills/canary-watch/SKILL.md) | Automated post-deployment smoke verification: HTTP endpoints, SSE streams, assets, and error spikes. | Post-deploy checks, release verification, smoke tests |
| [`github-ops`](skills/github-ops/SKILL.md) | Repository operations via GitHub CLI (`gh`): CI status monitoring, PR review pipelines, releases, issue triage. | GitHub Actions automation, PR lifecycle, release drafting |
| [`git-workflow`](skills/git-workflow/SKILL.md) | Git branching models, conventional commits, history cleanup, merge vs rebase, and conflict resolution. | Branch strategy, release tagging, squash/rebase workflows |

---

### 3. Cloud & Infrastructure Security

| Skill | Description | Key Triggers |
| :--- | :--- | :--- |
| [`cloud-infrastructure-security`](skills/cloud-infrastructure-security/SKILL.md) | Cloud security checklist covering AWS, Cloudflare, IAM least-privilege, CI/CD secrets, and IaC reviews. | Cloud deployment audit, IAM permissions, secrets management |
| [`security-review`](skills/security-review/SKILL.md) | Comprehensive checklist for authn/authz, input sanitization, API endpoints, tokens, CORS, and TLS. | API security review, secret hygiene, security hardening |
| [`security-scan`](skills/security-scan/SKILL.md) | Scans agent configs and project workspaces for secret leaks, vulnerable dependencies, and misconfigurations. | Config security scan, prompt injection & secret leakage audit |
| [`safety-guard`](skills/safety-guard/SKILL.md) | Guardrails against destructive operations (`rm -rf`, `git push --force`, database drop, destructive cloud commands). | Destructive command interception, blast-radius mitigation |

---

### 4. Networking, Homelab & Systems Automation

| Skill | Description | Key Triggers |
| :--- | :--- | :--- |
| [`cisco-ios-patterns`](skills/cisco-ios-patterns/SKILL.md) | Cisco IOS/IOS-XE configuration hierarchy, wildcard masks, ACL placement, and safe change windows. | Cisco switch/router configuration, ACL rules |
| [`netmiko-ssh-automation`](skills/netmiko-ssh-automation/SKILL.md) | Safe Python Netmiko patterns for batch SSH automation, TextFSM parsing, guarded changes, and timeouts. | Network device automation, bulk SSH script execution |
| [`network-bgp-diagnostics`](skills/network-bgp-diagnostics/SKILL.md) | BGP neighbor state, route exchanges, prefix policies, AS path inspection, and routing flap diagnosis. | BGP troubleshooting, routing convergence issues |
| [`network-config-validation`](skills/network-config-validation/SKILL.md) | Pre-deployment config linting: duplicate IPs, subnet overlaps, stale references, and IOS security hygiene. | Router/switch pre-deploy validation, syntax checks |
| [`network-interface-health`](skills/network-interface-health/SKILL.md) | Diagnostic runbook for interface CRC errors, packet drops, duplex mismatches, and link flapping. | Network interface degradation, packet loss troubleshooting |
| [`homelab-network-readiness`](skills/homelab-network-readiness/SKILL.md) | Readiness verification for VLAN segmentation, local DNS sinkholing, and WireGuard remote access. | Homelab architecture review, network change checklist |
| [`homelab-network-setup`](skills/homelab-network-setup/SKILL.md) | Gateway, switch, AP, IP subnet ranges, DHCP reservations, and local DNS planning. | Home/lab subnet design, physical & logical network topology |
| [`homelab-pihole-dns`](skills/homelab-pihole-dns/SKILL.md) | Pi-hole DNS sinkhole installation, DNS-over-HTTPS (DoH), DHCP integration, and split-horizon records. | Pi-hole configuration, internal DNS troubleshooting |
| [`homelab-vlan-segmentation`](skills/homelab-vlan-segmentation/SKILL.md) | UniFi, pfSense/OPNsense, and MikroTik VLAN segmentation (IoT, Guest, Trusted, Management) + firewall rules. | Network isolation, inter-VLAN firewall rules |
| [`homelab-wireguard-vpn`](skills/homelab-wireguard-vpn/SKILL.md) | WireGuard VPN server/client setup, key generation, split vs full tunneling, and remote access. | Secure remote access, site-to-site VPN, peer configuration |
| [`flox-environments`](skills/flox-environments/SKILL.md) | Declarative, reproducible Nix-based developer environments and system toolchain management. | Hermetic dev environments, package pinning without root |
| [`terminal-ops`](skills/terminal-ops/SKILL.md) | Evidence-first terminal execution, CI failure debugging, environment verification, and log capture. | CI log inspection, bash troubleshooting, diagnostic runs |
| [`terminal-opener`](skills/terminal-opener/SKILL.md) | Reusable launcher plan for launching background processes in visible terminal windows. | Interactive debugging, persistent terminal execution |

---

### 5. Observability, Reliability & SRE

| Skill | Description | Key Triggers |
| :--- | :--- | :--- |
| [`dashboard-builder`](skills/dashboard-builder/SKILL.md) | Builds actionable monitoring dashboards for Grafana and SigNoz that answer real operator questions. | Grafana dashboard design, metrics visualization, alerting |
| [`production-audit`](skills/production-audit/SKILL.md) | Local-evidence production readiness audit: failure modes, rollback readiness, and "what breaks in prod?". | Pre-launch review, post-merge audit, production sign-off |
| [`latency-critical-systems`](skills/latency-critical-systems/SKILL.md) | p99 tail latency optimization, connection pooling, cache stampede prevention, and latency budgets. | Performance bottlenecks, slow response times, connection leaks |
| [`enterprise-agent-ops`](skills/enterprise-agent-ops/SKILL.md) | Lifecycle controls (systemd, PM2, Docker), observability, kill switches, and rollout management for agent fleets. | Production daemon hosting, agent monitoring, health checks |
| [`error-handling`](skills/error-handling/SKILL.md) | Typed error hierarchies, circuit breakers, exponential backoff with jitter, and bulkhead isolation. | Service resiliency, retry storm mitigation, fault tolerance |

---

### 6. Database & Persistence Operations

| Skill | Description | Key Triggers |
| :--- | :--- | :--- |
| [`database-migrations`](skills/database-migrations/SKILL.md) | Safe zero-downtime migrations: expand-contract column renames, concurrent index creation, batched backfills. | Schema migrations, zero-downtime DB changes, rollbacks |
| [`postgres-patterns`](skills/postgres-patterns/SKILL.md) | PostgreSQL optimization, indexing strategies, query plan analysis (`EXPLAIN ANALYZE`), and RLS security. | Slow Postgres queries, table indexing, connection pooling |
| [`redis-patterns`](skills/redis-patterns/SKILL.md) | Redis data structures, distributed locking (Redlock), token-bucket rate limiting, and cache expiration. | Distributed lock patterns, cache eviction, pub/sub queues |

---

### 7. Verification & Quality Gates

| Skill | Description | Key Triggers |
| :--- | :--- | :--- |
| [`verification-loop`](skills/verification-loop/SKILL.md) | Six-phase verification pipeline: build, type check, lint, test coverage, security scan, and diff review. | Pre-commit/pre-merge validation, release gate enforcement |
| [`e2e-testing`](skills/e2e-testing/SKILL.md) | Playwright E2E testing patterns, Page Object Model, and flaky test mitigation for CI/CD pipelines. | CI end-to-end testing, browser automation smoke tests |
| [`automation-audit-ops`](skills/automation-audit-ops/SKILL.md) | Evidence-first inventory of background jobs, hooks, and connectors to identify overlaps or failures. | Cron job audit, automation cleanup, redundant job detection |

---

## Included DevOps Specialist Agents

Located in [`agents/`](agents/):

1. **`network-architect.md`**: Designs enterprise and homelab network topologies, IP addressing, and routing architectures.
2. **`network-config-reviewer.md`**: Reviews router, switch, and firewall configurations for security and performance anti-patterns.
3. **`network-troubleshooter.md`**: Diagnoses BGP drops, packet loss, interface errors, and connectivity failures.
4. **`homelab-architect.md`**: Guides homelab server setups, hypervisors, storage pools (ZFS), and network isolation.
5. **`database-reviewer.md`**: Reviews SQL schemas, migration safety, indexing strategies, and connection pooling.
6. **`security-reviewer.md`**: Audits authn/authz logic, secrets, OWASP compliance, and cloud permissions.
7. **`performance-optimizer.md`**: Investigates p99 latencies, CPU/memory profiles, and cache hit rates.
8. **`build-error-resolver.md`**: Analyzes compiler, dependency, and linker errors in CI pipelines.
9. **`e2e-runner.md`**: Orchestrates end-to-end smoke test execution and artifact collection.

---

## Installation & Usage

### Option 1: Use with Google Antigravity (AGY)

#### Workspace-Level (Project Specific)
Symlink or copy the `skills/` folder into your project's `.agents/skills` directory:

```bash
mkdir -p /path/to/my-project/.agents
ln -s /home/nikhil/Projects/cloud-devops-skills/skills /path/to/my-project/.agents/skills
```

#### Global-Level (All Projects on Machine)
To make all Cloud & DevOps skills available globally across all projects in Antigravity:

```bash
mkdir -p ~/.gemini/antigravity-cli/skills
cp -r /home/nikhil/Projects/cloud-devops-skills/skills/* ~/.gemini/antigravity-cli/skills/
```

### Option 2: Use with Claude Code

#### Workspace-Level
```bash
mkdir -p /path/to/my-project/.claude
ln -s /home/nikhil/Projects/cloud-devops-skills/skills /path/to/my-project/.claude/skills
```

#### Global-Level
```bash
mkdir -p ~/.claude/skills
cp -r /home/nikhil/Projects/cloud-devops-skills/skills/* ~/.claude/skills/
```

### Using the Automated Installer

You can also run the bundled installer script:

```bash
cd /home/nikhil/Projects/cloud-devops-skills
./install.sh --target antigravity --scope global
# or
./install.sh --target claude --scope global
```

---

## Suggested Improvements & Roadmap

The original ECC repository provided a great starting catalog for networking and deployment, but several critical Cloud & DevOps disciplines were missing. The following extensions are recommended for development:

1. 🏗️ **Terraform & OpenTofu (IaC) Skill**:
   - Module structures, remote state locking (S3/DynamoDB), tfvars management, plan drift detection, and `tflint`/`checkov` integration.
2. ☁️ **AWS Well-Architected / GCP Cloud Native Skill**:
   - VPC peering/Transit Gateway, ECS/Fargate deployment patterns, S3 lifecycle rules, IAM roles for service accounts (IRSA), CloudFront caching.
3. 📊 **OpenTelemetry & Prometheus Instrumentation Skill**:
   - Trace context propagation, RED/USE metrics collection, Prometheus alert rules, Grafana Loki log aggregation.
4. 🐧 **Linux Kernel & SRE Performance Troubleshooting**:
   - `sysctl` kernel network tuning, systemd unit design, journald log rotation, eBPF inspection, disk I/O scheduling.
5. 📜 **Ansible & Configuration Management**:
   - Idempotent playbooks, inventory management, Ansible Vault secrets, and CI linting (`ansible-lint`).
