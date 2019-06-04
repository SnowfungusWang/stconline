package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.User;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class EntrustAction {

    @Autowired
    private STCProcessEngine stcProcessEngine;

    @Autowired
    private TaskService taskService;

    /**
     * 根据JSON数据创建Process
     * @param param
     * @param user
     */
    public void createEntrustProcess(JSONObject param, User user) {
        Entrust entrust = JSONObject.toJavaObject(param, Entrust.class);
        createEntrustProcess(entrust, user);
    }

    /**
     * 根据Entrust实体创建Process
     * @param entrust
     * @param user
     */
    public String createEntrustProcess(Entrust entrust, User user) {
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("EntrustID", entrust.getPid());
        variable.put("ClientID", user.getUserID());

        /**
         * TODO: 根据具体的权限策略(Spring Security or Shiro?)从当前用户组中取出可以进行委托审核操作的工作人员组
         *       是否需要修改.bpmn.xml？工作人员组可能在流程创立之后发生变动，需要使用安全框架实时更新权限组，待研究
         */
        variable.put("WorkerIDs", "w1");
        variable.put("WorkerIDs", "w2");

        entrust.setProcessInstanceID(stcProcessEngine.createProcess("Entrust", variable));
        entrust.setProcessState(ProcessState.ToSubmit);
        return entrust.getProcessInstanceID();
    }

    /**
     * 获取EntrustProcess状态
     * @param processInstanceId
     * @return 状态信息
     */
    public String getEntrustProcessState(String processInstanceId) {
        return stcProcessEngine.getProcessState(processInstanceId);
    }

    /**
     * 更新委托流程状态
     * @param entrust
     * @param operation
     * @throws Exception
     */
    public void updateEntrustProcess(Entrust entrust, String operation, String comment) throws Exception {
        /**
         * TODO: 验证user，需要用到安全框架
         */
        Task task = taskService.createTaskQuery().processInstanceId(entrust.getProcessInstanceID()).singleResult();
        switch (task.getName()) {
            case "ToSubmit":
                taskService.complete(task.getId());
                break;
            case "ToReview":
                Map<String, Object> variable = new HashMap<>();
                variable.put("reviewEntrustResult", operation);
                taskService.complete(task.getId(), variable);
                break;
            default: throw new Exception();
        }
    }

    public void deleteEntrustProcess(Entrust entrust) {
        stcProcessEngine.deleteProcessInstance(entrust.getProcessInstanceID());
    }

}
