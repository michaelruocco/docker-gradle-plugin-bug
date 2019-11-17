I am seeing a strange bug when trying to push a docker image to docker hub, to recreate this requires two environment
variables to be set up for docker hub login username (DOCKER_USERNAME) and password (DOCKER_PASSWORD.)

Once these are set up, the problem I am seeing is that locally I get an error that looks like the one below, although
the push does actually work when falling back to the default mechanism.

Running the command

```
./gradlew clean build buildImage pushImage
```

Gives the following output

```
Pushing image 'michaelruocco/gradle-docker-plugin-bug:latest'.
Failure when attempting to lookup auth config (docker repository: , configFile: /Users/michaelruocco/.docker/config.json. Falling back to docker-java default behaviour
groovy.json.JsonException: null not parse properly

The current character read is 'n' with an int value of 110
null not parse properly
line number 1
index number 1
no credentials server URL
.^
        at org.apache.groovy.json.internal.JsonParserCharArray.decodeNull(JsonParserCharArray.java:234)
        at org.apache.groovy.json.internal.JsonParserCharArray.decodeValueInternal(JsonParserCharArray.java:178)
        at org.apache.groovy.json.internal.JsonParserCharArray.decodeValue(JsonParserCharArray.java:157)
        at org.apache.groovy.json.internal.JsonParserCharArray.decodeFromChars(JsonParserCharArray.java:46)
        at org.apache.groovy.json.internal.JsonParserCharArray.parse(JsonParserCharArray.java:384)
        at org.apache.groovy.json.internal.BaseJsonParser.parse(BaseJsonParser.java:112)
        at groovy.json.JsonSlurper.parseText(JsonSlurper.java:205)
        at com.bmuschko.gradle.docker.internal.RegistryAuthLocator.runCredentialProvider(RegistryAuthLocator.groovy:252)
        at com.bmuschko.gradle.docker.internal.RegistryAuthLocator.authConfigUsingStore(RegistryAuthLocator.groovy:271)
        at com.bmuschko.gradle.docker.internal.RegistryAuthLocator.lookupAuthConfig(RegistryAuthLocator.groovy:123)
        at com.bmuschko.gradle.docker.internal.RegistryAuthLocator.lookupAuthConfig(RegistryAuthLocator.groovy:81)
        at com.bmuschko.gradle.docker.tasks.image.DockerPushImage.runRemoteCommand(DockerPushImage.groovy:55)
        at com.bmuschko.gradle.docker.tasks.AbstractDockerRemoteApiTask.start(AbstractDockerRemoteApiTask.groovy:73)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)
        at java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)
        at java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)
        at java.base/java.lang.reflect.Method.invoke(Method.java:566)
        at org.gradle.internal.reflect.JavaMethod.invoke(JavaMethod.java:103)
        at org.gradle.api.internal.project.taskfactory.StandardTaskAction.doExecute(StandardTaskAction.java:48)
        at org.gradle.api.internal.project.taskfactory.StandardTaskAction.execute(StandardTaskAction.java:41)
        at org.gradle.api.internal.project.taskfactory.StandardTaskAction.execute(StandardTaskAction.java:28)
        at org.gradle.api.internal.AbstractTask$TaskActionWrapper.execute(AbstractTask.java:705)
        at org.gradle.api.internal.AbstractTask$TaskActionWrapper.execute(AbstractTask.java:672)
        at org.gradle.api.internal.tasks.execution.ExecuteActionsTaskExecuter$4.run(ExecuteActionsTaskExecuter.java:338)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor$RunnableBuildOperationWorker.execute(DefaultBuildOperationExecutor.java:402)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor$RunnableBuildOperationWorker.execute(DefaultBuildOperationExecutor.java:394)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor$1.execute(DefaultBuildOperationExecutor.java:165)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor.execute(DefaultBuildOperationExecutor.java:250)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor.execute(DefaultBuildOperationExecutor.java:158)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor.run(DefaultBuildOperationExecutor.java:92)
        at org.gradle.internal.operations.DelegatingBuildOperationExecutor.run(DelegatingBuildOperationExecutor.java:31)
        at org.gradle.api.internal.tasks.execution.ExecuteActionsTaskExecuter.executeAction(ExecuteActionsTaskExecuter.java:327)
        at org.gradle.api.internal.tasks.execution.ExecuteActionsTaskExecuter.executeActions(ExecuteActionsTaskExecuter.java:312)
        at org.gradle.api.internal.tasks.execution.ExecuteActionsTaskExecuter.access$200(ExecuteActionsTaskExecuter.java:75)
        at org.gradle.api.internal.tasks.execution.ExecuteActionsTaskExecuter$TaskExecution.execute(ExecuteActionsTaskExecuter.java:158)
        at org.gradle.internal.execution.impl.steps.ExecuteStep.execute(ExecuteStep.java:46)
        at org.gradle.internal.execution.impl.steps.CancelExecutionStep.execute(CancelExecutionStep.java:34)
        at org.gradle.internal.execution.impl.steps.TimeoutStep.executeWithoutTimeout(TimeoutStep.java:69)
        at org.gradle.internal.execution.impl.steps.TimeoutStep.execute(TimeoutStep.java:49)
        at org.gradle.internal.execution.impl.steps.CatchExceptionStep.execute(CatchExceptionStep.java:34)
        at org.gradle.internal.execution.impl.steps.CreateOutputsStep.execute(CreateOutputsStep.java:49)
        at org.gradle.internal.execution.impl.steps.SnapshotOutputStep.execute(SnapshotOutputStep.java:42)
        at org.gradle.internal.execution.impl.steps.SnapshotOutputStep.execute(SnapshotOutputStep.java:28)
        at org.gradle.internal.execution.impl.steps.CacheStep.executeWithoutCache(CacheStep.java:133)
        at org.gradle.internal.execution.impl.steps.CacheStep.lambda$execute$5(CacheStep.java:83)
        at java.base/java.util.Optional.orElseGet(Optional.java:369)
        at org.gradle.internal.execution.impl.steps.CacheStep.execute(CacheStep.java:82)
        at org.gradle.internal.execution.impl.steps.CacheStep.execute(CacheStep.java:37)
        at org.gradle.internal.execution.impl.steps.PrepareCachingStep.execute(PrepareCachingStep.java:33)
        at org.gradle.internal.execution.impl.steps.StoreSnapshotsStep.execute(StoreSnapshotsStep.java:38)
        at org.gradle.internal.execution.impl.steps.StoreSnapshotsStep.execute(StoreSnapshotsStep.java:23)
        at org.gradle.internal.execution.impl.steps.SkipUpToDateStep.executeBecause(SkipUpToDateStep.java:95)
        at org.gradle.internal.execution.impl.steps.SkipUpToDateStep.lambda$execute$0(SkipUpToDateStep.java:88)
        at java.base/java.util.Optional.map(Optional.java:265)
        at org.gradle.internal.execution.impl.steps.SkipUpToDateStep.execute(SkipUpToDateStep.java:52)
        at org.gradle.internal.execution.impl.steps.SkipUpToDateStep.execute(SkipUpToDateStep.java:36)
        at org.gradle.internal.execution.impl.DefaultWorkExecutor.execute(DefaultWorkExecutor.java:34)
        at org.gradle.api.internal.tasks.execution.ExecuteActionsTaskExecuter.execute(ExecuteActionsTaskExecuter.java:109)
        at org.gradle.api.internal.tasks.execution.ResolveIncrementalChangesTaskExecuter.execute(ResolveIncrementalChangesTaskExecuter.java:84)
        at org.gradle.api.internal.tasks.execution.ResolveTaskOutputCachingStateExecuter.execute(ResolveTaskOutputCachingStateExecuter.java:91)
        at org.gradle.api.internal.tasks.execution.ResolveBeforeExecutionStateTaskExecuter.execute(ResolveBeforeExecutionStateTaskExecuter.java:74)
        at org.gradle.api.internal.tasks.execution.ValidatingTaskExecuter.execute(ValidatingTaskExecuter.java:58)
        at org.gradle.api.internal.tasks.execution.SkipEmptySourceFilesTaskExecuter.execute(SkipEmptySourceFilesTaskExecuter.java:109)
        at org.gradle.api.internal.tasks.execution.ResolveBeforeExecutionOutputsTaskExecuter.execute(ResolveBeforeExecutionOutputsTaskExecuter.java:67)
        at org.gradle.api.internal.tasks.execution.ResolveAfterPreviousExecutionStateTaskExecuter.execute(ResolveAfterPreviousExecutionStateTaskExecuter.java:46)
        at org.gradle.api.internal.tasks.execution.CleanupStaleOutputsExecuter.execute(CleanupStaleOutputsExecuter.java:93)
        at org.gradle.api.internal.tasks.execution.FinalizePropertiesTaskExecuter.execute(FinalizePropertiesTaskExecuter.java:45)
        at org.gradle.api.internal.tasks.execution.ResolveTaskExecutionModeExecuter.execute(ResolveTaskExecutionModeExecuter.java:94)
        at org.gradle.api.internal.tasks.execution.SkipTaskWithNoActionsExecuter.execute(SkipTaskWithNoActionsExecuter.java:57)
        at org.gradle.api.internal.tasks.execution.SkipOnlyIfTaskExecuter.execute(SkipOnlyIfTaskExecuter.java:56)
        at org.gradle.api.internal.tasks.execution.CatchExceptionTaskExecuter.execute(CatchExceptionTaskExecuter.java:36)
        at org.gradle.api.internal.tasks.execution.EventFiringTaskExecuter$1.executeTask(EventFiringTaskExecuter.java:63)
        at org.gradle.api.internal.tasks.execution.EventFiringTaskExecuter$1.call(EventFiringTaskExecuter.java:49)
        at org.gradle.api.internal.tasks.execution.EventFiringTaskExecuter$1.call(EventFiringTaskExecuter.java:46)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor$CallableBuildOperationWorker.execute(DefaultBuildOperationExecutor.java:416)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor$CallableBuildOperationWorker.execute(DefaultBuildOperationExecutor.java:406)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor$1.execute(DefaultBuildOperationExecutor.java:165)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor.execute(DefaultBuildOperationExecutor.java:250)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor.execute(DefaultBuildOperationExecutor.java:158)
        at org.gradle.internal.operations.DefaultBuildOperationExecutor.call(DefaultBuildOperationExecutor.java:102)
        at org.gradle.internal.operations.DelegatingBuildOperationExecutor.call(DelegatingBuildOperationExecutor.java:36)
        at org.gradle.api.internal.tasks.execution.EventFiringTaskExecuter.execute(EventFiringTaskExecuter.java:46)
        at org.gradle.execution.plan.LocalTaskNodeExecutor.execute(LocalTaskNodeExecutor.java:43)
        at org.gradle.execution.taskgraph.DefaultTaskExecutionGraph$InvokeNodeExecutorsAction.execute(DefaultTaskExecutionGraph.java:355)
        at org.gradle.execution.taskgraph.DefaultTaskExecutionGraph$InvokeNodeExecutorsAction.execute(DefaultTaskExecutionGraph.java:343)
        at org.gradle.execution.taskgraph.DefaultTaskExecutionGraph$BuildOperationAwareExecutionAction.execute(DefaultTaskExecutionGraph.java:336)
        at org.gradle.execution.taskgraph.DefaultTaskExecutionGraph$BuildOperationAwareExecutionAction.execute(DefaultTaskExecutionGraph.java:322)
        at org.gradle.execution.plan.DefaultPlanExecutor$ExecutorWorker$1.execute(DefaultPlanExecutor.java:134)
        at org.gradle.execution.plan.DefaultPlanExecutor$ExecutorWorker$1.execute(DefaultPlanExecutor.java:129)
        at org.gradle.execution.plan.DefaultPlanExecutor$ExecutorWorker.execute(DefaultPlanExecutor.java:202)
        at org.gradle.execution.plan.DefaultPlanExecutor$ExecutorWorker.executeNextNode(DefaultPlanExecutor.java:193)
        at org.gradle.execution.plan.DefaultPlanExecutor$ExecutorWorker.run(DefaultPlanExecutor.java:129)
        at org.gradle.internal.concurrent.ExecutorPolicy$CatchAndRecordFailures.onExecute(ExecutorPolicy.java:63)
        at org.gradle.internal.concurrent.ManagedExecutorImpl$1.run(ManagedExecutorImpl.java:46)
        at java.base/java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1128)
        at java.base/java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:628)
        at org.gradle.internal.concurrent.ThreadFactoryImpl$ManagedThreadRunnable.run(ThreadFactoryImpl.java:55)
        at java.base/java.lang.Thread.run(Thread.java:834)
```

For reference the contents of the file at /Users/michaelruocco/.docker/config.json is:

```
    "auths": {
        "https://index.docker.io/v1/": {}
    },
    "HttpHeaders": {
        "User-Agent": "Docker-Client/19.03.4 (darwin)"
    },
    "credsStore": "desktop",
    "experimental": "disabled",
    "stackOrchestrator": "swarm"
}
```

I suspect that the problem may be related to the empty auth block for "htts://index.docker/io/v1/": {} but this is a
complete guess!

A similar, but not the same, issue is also occuring on travis ci builds too.