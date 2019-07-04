package com.example.stc.service.impl;

import com.example.stc.activiti.ProcessState;
import com.example.stc.domain.TestReport;
import com.example.stc.domain.User;
import com.example.stc.framework.exception.TestReportNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.repository.TestReportRepository;
import com.example.stc.service.TestReportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestReportServiceImpl implements TestReportService {

    Logger logger = LoggerFactory.getLogger(ContractServiceImpl.class);

    @Autowired
    private TestReportRepository testReportRepository;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Autowired
    private ProcessUtils processUtils;

    @Override
    public List<TestReport> findAllTestReports() {
        return testReportRepository.findAll();
    }

    @Override
    public List<TestReport> findTestReportsByAuthority() {
        User curUser = authorityUtils.getLoginUser();
        logger.info("findTestReportsByAuthority: 当前登录者id = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
        List<TestReport> allTestReports = this.findAllTestReports();
        allTestReports.removeIf(testReport -> !processUtils.isVisible(testReport, "TestReport"));
        return allTestReports;
    }

    @Override
    public TestReport findTestReportByPid(String pid) {
        TestReport testReport = testReportRepository.findByPid(pid);
        if (testReport == null)
            throw new TestReportNotFoundException(pid);
        return testReport;
    }

    @Override
    public TestReport newTestReport(String pid, String uid) {
        logger.info("newTestReportAuto: ");
        TestReport testReport = new TestReport();
        testReport.setPid(pid);
        testReport.setUserId(uid);
        testReport.setProcessState(ProcessState.Submit); // 待提交（未进入流程）
        return testReportRepository.save(testReport);
    }

    @Override
    public TestReport updateTestReport(String pid, TestReport record) {
        TestReport testReport = testReportRepository.findByPid(pid);
        record.setId(testReport.getId());
        record.setPid(testReport.getPid());
        record.setProcessState(testReport.getProcessState());
        record.setProcessInstanceId(testReport.getProcessInstanceId());
        return testReportRepository.save(record);
    }

    @Override
    public void deleteTestReportById(Long id) {
        testReportRepository.deleteById(id);
    }

    @Override
    public void deleteTestReportByPid(String pid) {
        TestReport testReport = testReportRepository.findByPid(pid);
        if (testReport == null)
            throw new TestReportNotFoundException(pid);
        testReportRepository.deleteByPid(pid);
    }
}
