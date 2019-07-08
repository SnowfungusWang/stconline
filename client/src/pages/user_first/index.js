import React from 'react';
import ReactDOM from 'react-dom';
import Link from 'umi/link';
import {Card, Carousel, Steps, Collapse, Row, Col, Divider, Avatar, Pagination} from 'antd'
import 'antd/dist/antd.css'
import styles from "./index.css"
import { FormattedMessage,formatMessage } from 'umi/locale';
import {getRole} from "../../utils/cookieUtils";
import {connect} from 'dva';
import { get } from 'http';
import { SSL_OP_SSLEAY_080_CLIENT_DH_BUG } from 'constants';

const { Step } = Steps;
const { Panel } = Collapse;
const namespace = 'user_first';

function callback(key) {
    console.log(key);
}

const mapStateToProps = (state) => {
    const listdata = state[namespace];
    console.log("输出listdata",listdata);
    //let p = state[namespace].process;
    //console.log("输出p",p);
    //console.log("试着输出softname",listdata.data.length);
    return {
      listdata,
    };
};
const mapDispatchToProps = (dispatch,state) => {
    return {
      onDidMount: () => {
          console.log("???")
        dispatch({
          type: `${namespace}/GetAllEntrust`,
        })
      },
      getP: (pid) => {
          console.log(pid)
          dispatch({
              type: `${namespace}/GetProcess`,
              payload: pid
          })
          //listdata = state[namespace];
          //console.log("输出listdata",listdata);
          //console.log("结束之后的pid",pid)
          return 3;
      }
    }
};
const data = [];

// const getProcess = (dispatch) => {
//     return {
//         getP: (pid) => {
//             dispatch({
//                 type: `${namespace}/GetProcess`,
//                 payload: pid
//             });
//         },
//     };
// };
// const getP = (dispatch) => {
//     var res = 3;
//     //const dispatch = this.props;
//     //console.log("输出dispatch:",this.props)
//     dispatch({
//         type: `${namespace}/GetProcess`,
//         payload: pid
//     });
//     return res;
// }

let pro = 0;
  
@connect(mapStateToProps, mapDispatchToProps)
export default class Carousels extends React.Component{
    // constructor(props) {
    //     super(props);
    //     this.state = {
    //       process: ""
    //     }
    // }
    componentDidMount() {
        this.props.onDidMount();
        //console.log("这里是不是没输出啊",this.props.state);
        //this.props.getP(this.props.listdata.data[0].pid);
        //this.props.getP(this.props.listdata.data[1].pid);
        //this.props.getP(this.props.listdata.data[2].pid);
    }

    // getP = (dispatch) => {
    //     var res = 3;
    //     //const dispatch = this.props;
    //     //console.log("输出dispatch:",this.props)
    //     dispatch({
    //        type: `${namespace}/GetProcess`,
    //        //payload: pid
    //     });
    //     return res;
    // }
    
    // userLinkMapper= {
    //     "QM": (key) => (
    //       <span>
    //         <Divider type="vertical"/>
    //         {<Link to={{pathname: './plan_check', query: {pid: key.pid}}}>查看详情</Link>}
    //   </span>
    //     ),
    
    //     "TM": (key) => (
    //       <span>
    //         <Divider type="vertical"/>
    //         {<Link to={{pathname: './plan_check', query: {pid: key.pid}}}>查看详情</Link>}
    //         <Divider type="vertical"/>
    //         {key.processState === 'Approve' ?<Link to={{pathname: './record-list', query: {pid: key.pid}}}>查看测试记录</Link>:null}
    
    //   </span>
    //     ),
    
    
    //     "TS": (key) => (
    //       <span>
    //         {<Link to={{pathname: './plan_check', query: {pid: key.pid}}}>查看详情</Link>}
    //         <Divider type="vertical"/>
    //         {key.processState === 'Approve' ? <Link to={{pathname: './record-list', query: {pid: key.pid}}}>查看测试记录</Link>:null}
    //         <Divider type="vertical"/>
    //         {key.processState === 'Submit' ? <Link to={{pathname: '../../plan_edit', query: {pid: key.pid}}}>编辑</Link>:null}
    //     </span>
    //     ),
    //   };
    
    //   link(){
    //     return this.userLinkMapper[getRole()[0]]
    // }

    render(){
        return (
            <div>
                <Card title="工作台">
                <Row>
                    <Col span={2}>
                    <Avatar
                        size={64}
                        icon="user"
                     />
                     </Col>
                     <Col span={18}>
                    <div>你好，{getRole()[0]}，今天也是努力搬砖的一天呢</div>
                    <iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=99" width="160" height="36" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe>
                    </Col>
                    <h1>南京大学软件测试中心</h1>
                    <Avatar src="http://ise.nju.edu.cn/author/admin/avatar_hu65273352f63401a5ced919c03e133798_24423_250x250_fill_q90_lanczos_center.jpg" />
                </Row>
                </Card>
                <br />
                <br />

                <Card 
                title="近期的项目"
                bordered={false}
                >
                    {/* <p><FormattedMessage id={(!this.props.listdata.data.length)? "未命名":this.props.listdata.data[0].softwareName}/></p> 
                    <br /> */}
                    <Collapse onChange={callback}>
                    <Panel header={(!this.props.listdata.data.length)? "未有项目":this.props.listdata.data[0].softwareName} disabled={(!this.props.listdata.data.length)}>
                    <Steps current={(!(this.props.listdata.data.length>0))? 0: this.props.listdata.pstate1.state-1} size="small">
                        <Step title="委托" description="这是委托的描述." />
                        <Step title="合同" description="这是合同的描述." />
                        <Step title="测试方案" description="这是测试方案的描述." />
                        <Step title="测试报告" description="这是测试报告的描述." />
                        <Step title="结项" description="这是结项的描述." />
                    </Steps>
                    </Panel>
                    <Divider />
                    <Panel header={(!(this.props.listdata.data.length>1))? "未有项目":this.props.listdata.data[1].softwareName} disabled={(!(this.props.listdata.data.length>1))}>
                    <Steps current={(!(this.props.listdata.data.length>1))? 0: this.props.listdata.pstate2.state-1} size="small">
                        <Step title="委托" description="这是委托的描述." />
                        <Step title="合同" description="这是合同的描述." />
                        <Step title="测试方案" description="这是测试方案的描述." />
                        <Step title="测试报告" description="这是测试报告的描述." />
                        <Step title="结项" description="这是结项的描述." />
                    </Steps>
                    </Panel>
                    <Divider />
                    <Panel header={(!(this.props.listdata.data.length>2))? "未有项目":this.props.listdata.data[2].softwareName} disabled={(!(this.props.listdata.data.length>2))}>
                    <Steps current={(!(this.props.listdata.data.length>2))? 0: this.props.listdata.pstate3.state-1} size="small">
                        <Step title="委托" description="这是委托的描述." />
                        <Step title="合同" description="这是合同的描述." />
                        <Step title="测试方案" description="这是测试方案的描述." />
                        <Step title="测试报告" description="这是测试报告的描述." />
                        <Step title="结项" description="这是结项的描述." />
                    </Steps>
                    </Panel>
                    </Collapse>
                </Card>
            </div>
        )
    }
};

//合同的客户同意、不同意
//SSA不能删合同，，把删除按钮隐藏
//编辑页面的删除按钮删掉
