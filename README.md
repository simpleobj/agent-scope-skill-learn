# AgentScope Git Skill Repository Demo

这是一个用于学习 AgentScope Java `GitSkillRepository` 的最小示例仓库。

## 仓库结构

```text
skills/
└── java-code-reviewer/
    ├── SKILL.md
    ├── references/
    │   └── style-guide.md
    └── scripts/
        └── run-checks.sh
```

AgentScope 的 `GitSkillRepository` 会优先把仓库中的 `skills/` 目录当作 Skill 根目录；每个 Skill 是一个子目录，并且必须包含 `SKILL.md`。

## Maven 依赖

```xml
<dependency>
    <groupId>io.agentscope</groupId>
    <artifactId>agentscope-extensions-skill-git-repository</artifactId>
    <version>${agentscope.version}</version>
</dependency>
```

## 在 HarnessAgent 中加载

```java
import io.agentscope.core.skill.repository.GitSkillRepository;
import io.agentscope.harness.agent.HarnessAgent;

GitSkillRepository skillRepository = new GitSkillRepository(
        "https://github.com/simpleobj/agent-scope-skill-learn.git");

HarnessAgent agent = HarnessAgent.builder()
        .name("assistant")
        .model(model)
        .workspace(workspace)
        .skillRepository(skillRepository)
        .build();
```

之后 Agent 会先看到 Skill 的 `name` 和 `description`。当用户的问题命中 Skill 时，再按需加载完整 `SKILL.md` 以及其中引用的资源文件。

## 自动同步

默认情况下，每次读取 Skill 时会做轻量的远端 HEAD 检查；只有远端发生变化时才 pull。

如果希望自己控制更新时间：

```java
GitSkillRepository skillRepository = new GitSkillRepository(
        "https://github.com/simpleobj/agent-scope-skill-learn.git",
        false);

skillRepository.sync();
```

## 测试方式

启动 Agent 后可以问：

```text
帮我审查一下这个 Java 项目，重点看看异常处理、日志和明显的代码坏味道。
```

如果 Skill 被正确注册，模型会识别 `java-code-reviewer`，加载它的说明，并按照 Skill 中定义的流程完成审查。
