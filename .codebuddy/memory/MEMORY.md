# 项目长期记忆：kkFileView-jdk1.8 分支约定

- 本仓库 `jiangchuanso/kkFileView-jdk1.8` 是 `kekingcn/kkFileView` 的 jdk1.8 分支，**必须保留 JDK 1.8 / Spring Boot 2.4.2**（上游已从 #687 `f6c6e22b` 升级到 JDK21 / SB 3.5.6，禁止合入该升级族 4 个提交）。
- 从上游合入的取舍规则（用户 2026-08-30 明确）：**安全限制类功能不要**（如 #656 禁用上传接口、#684 上传禁用体验）；**预览能力类要**（如 #685 JSON 格式化预览、#686 Kl json）。
- 已确认可直接 cherry-pick 的升级前 Java 提交仅 4 个（均 0 处 jakarta）：#656/#684(安全,排除)、#685/#686(预览,已合入分支 `feat/upstream-json-preview`)。升级后的 37 个 Java 提交需手工移植(jakarta→javax、SB3→2、Java17→8)。
- sevenzipjbinding 按架构分包：Maven profile `sevenzip-all`(默认 amd64)/`sevenzip-linux-arm64`/`sevenzip-mac-x86_64`；工作流按架构矩阵构建并产出 `dist/kkFileView-<arch>.tar.gz`；Dockerfile 用 `ARG TARGETARCH`。
- 工作流 `maven-publish.yml` 在推送 `v*` tag 时通过 `softprops/action-gh-release@v2` 发布 GitHub Release，附件为各架构 tar.gz/zip（制品名 `BUILD_ARTIFACT-<arch>`）。
- 远程：`origin`=jiangchuanso(本分支)，`keking`=kekingcn/kkFileView(上游，已 fetch 全量)，`upstream`=xxs3315/kkFileView(预置，非本任务上游)。
