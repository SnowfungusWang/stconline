package com.example.stc.controller;

import com.example.stc.domain.TestRecord;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.service.TestRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * 测试记录相关接口
 */
@RestController
public class TestRecordController extends BaseController {

    Logger logger = LoggerFactory.getLogger(EntrustController.class);

    @Autowired
    private TestRecordService testRecordService;

    @Autowired
    private AuthorityUtils authorityUtils;

    /**
     * 添加Link，使 TestRecord -> Resource<TestRecord>
     */
    private static Resource<TestRecord> toResource(TestRecord testRecord) {
        return new Resource<>(testRecord
                , linkTo(methodOn(TestRecordController.class).getOneTestRecord(testRecord.getTestId())).withSelfRel()
                , linkTo(methodOn(TestRecordController.class).getAllTestRecords()).withSelfRel()
        );
    }
    
    /**
     * 查看全部测试记录
     * TS, TM可查看
     */
    @Secured({"ROLE_TS", "ROLE_TM"})
    @GetMapping(path = "/testRecord/all")
    public @ResponseBody
    Resources<Resource<TestRecord>> getAllTestRecords() {
        List<Resource<TestRecord>> testRecords = testRecordService.findAllTestRecords().stream()
                .map(TestRecordController::toResource)
                .collect(Collectors.toList());
        logger.info("getAllTestRecords: 最终查询测试记录数：" + testRecords.size());
        return new Resources<>(testRecords,
                linkTo(methodOn(TestRecordController.class).getAllTestRecords()).withSelfRel());
    }

    /**
     * 查看某一项目全部测试记录
     * TS, TM可查看
     */
    @Secured({"ROLE_TS", "ROLE_TM"})
    @GetMapping(path = "/testRecord")
    public @ResponseBody
    Resources<Resource<TestRecord>> getProjectTestRecords(@RequestParam String pid) {
        List<Resource<TestRecord>> testRecords = testRecordService.findAllTestRecordsByPidByAuthority(pid).stream()
                .map(TestRecordController::toResource)
                .collect(Collectors.toList());
        logger.info("getProjectTestRecords: 最终查询测试记录数：" + testRecords.size());
        return new Resources<>(testRecords,
                linkTo(methodOn(TestRecordController.class).getProjectTestRecords(pid)).withSelfRel());
    }

    /**
     * 新建测试记录
     * TS可随时新建
     * @throws URISyntaxException
     */
    @Secured({"ROLE_TS"})
    @PostMapping(path = "/testRecord")
    public @ResponseBody
    ResponseEntity<?> addNewTestRecord(@RequestBody TestRecord testRecord) throws URISyntaxException {
        // testRecord参数中的TestCase是已经填好的
        logger.info("addNewTestRecord");
        Resource<TestRecord> resource = toResource(testRecordService.newTestRecord(testRecord));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 查看单个测试记录
     * TS, TM可查看
     */
    @Secured({"ROLE_TS", "ROLE_TM"})
    @GetMapping(path = "/testRecord/{testId}")
    public @ResponseBody
    Resource<TestRecord> getOneTestRecord(@PathVariable String testId) {
        logger.info("getOneTestRecord");
        TestRecord testRecord = testRecordService.findTestRecordByTestId(testId);
        return toResource(testRecord);
    }

    /**
     * 修改单个测试记录
     * 仅TS在Submit阶段可查看
     * @throws URISyntaxException
     */
    @Secured({"ROLE_TS"})
    @PutMapping(path = "/testRecord/{testId}")
    public @ResponseBody
    ResponseEntity<?> replaceTestRecord(@PathVariable String testId, @RequestBody TestRecord testRecord) throws URISyntaxException {
        authorityUtils.stateAccessCheck(testRecord, "TS", "Submit", "修改");
        logger.info("replaceTestRecord");
        TestRecord updatedTestRecord = testRecordService.updateTestRecord(testId, testRecord);
        Resource<TestRecord> resource = toResource(updatedTestRecord);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个测试记录
     */
    @Secured({"ROLE_TS"})
    @DeleteMapping(path = "/testRecord/{testId}")
    public @ResponseBody
    ResponseEntity<?> deleteTestRecord(@PathVariable String testId) {
        TestRecord testRecord = testRecordService.findTestRecordByTestId(testId);
        authorityUtils.stateAccessCheck(testRecord, "TS", "Submit", "删除");
        logger.info("deleteTestRecord");
        testRecordService.deleteTestRecordByTestId(testId);
        return ResponseEntity.noContent().build();
    }
}
