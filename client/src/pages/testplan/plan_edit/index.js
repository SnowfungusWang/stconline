import React, { PureComponent } from 'react';
import { connect } from 'dva';
import { formatMessage, FormattedMessage } from 'umi/locale';
import {
  Form,
  Input,
  DatePicker,
  Select,
  Button,
  Card,
  InputNumber,
  Radio,
  Icon,
  Tooltip,
  Modal,
  Breadcrumb
} from 'antd';
import moment from 'moment';


const FormItem = Form.Item;
const { Option } = Select;
const { RangePicker } = DatePicker;
const { TextArea } = Input;
const confirm=Modal.confirm;

const dateFormat = 'YYYY/MM/DD';

//删除按钮的对话框方法，点击“确认删除”调取delete方法
function showDeleteConfirm() {
  confirm({
    title: '您是否要删除本委托?',
    content: '委托一旦删除不可恢复',
    okText: '确认删除',
    okType: 'danger',
    cancelText: '取消',
    onOk() {
      console.log('OK');
      //在此方法里使用delete
    },
    onCancel() {
      console.log('Cancel');
    },
  });
}

//提交按钮的对话框方法，点击“提交”调取提交方法
function showConfirm() {
  confirm({
    title: '您是否要提交本委托?',
    content: '委托一旦提交，将无法从线上更改，但您可以在“委托列表”查看本委托详情。提交的委托将由工作人员进行核对。',
    okText: '提交',
    cancelText: '取消',
    onOk() {
      console.log('OK');
      //在此方法里提交
    },
    onCancel() {
      console.log('Cancel');
    },
  });
}

@connect(({ loading }) => ({
  submitting: loading.effects['basicForm/submitRegularForm'],
}))
@Form.create()
class BasicForm extends PureComponent {
  handleSubmit = e => {
    const { dispatch, form } = this.props;
    e.preventDefault();
    form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        dispatch({
          type: 'basicForm/submitRegularForm',
          payload: values,
        });
      }
    });
  };

  submit = () => {
    this.setState({
      visible: true,
      current: undefined,
    });
    dispatch({
      type: 'basicForm/submitRegularForm',
      payload: values,
    });
  };

  render() {
    const { submitting } = this.props;
    const {
      form: { getFieldDecorator, getFieldValue },
    } = this.props;

    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 7 },
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 12 },
        md: { span: 10 },
      },
    };

    const submitFormLayout = {
      wrapperCol: {
        xs: { span: 24, offset: 0 },
        sm: { span: 10, offset: 7 },
      },
    };

    return (
      <div>
        <Breadcrumb>
          <Breadcrumb.Item href="/welcome.html">主页</Breadcrumb.Item>
          <Breadcrumb.Item>测试方案编辑</Breadcrumb.Item>
        </Breadcrumb>
        <br />
        <Card bordered={false}>
          <h1>软件委托测试方案</h1>
        </Card>
        <br />
        <Card bordered={false}>
          <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.edit.label" />}>
            {getFieldDecorator('edit', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'validation.edit.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'testplan.edit.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.check.label" />}>
            {getFieldDecorator('check', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'validation.check.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'testplan.check.placeholder' })} />)}
          </FormItem>
          <FormItem {...formItemLayout} label={<FormattedMessage id="testplan.approve.label" />}>
            {getFieldDecorator('approve', {
              rules: [
                {
                  required: true,
                  message: formatMessage({ id: 'validation.approve.required' }),
                },
              ],
            })(<Input placeholder={formatMessage({ id: 'testplan.approve.placeholder' })} />)}
          </FormItem>

        </Card>
        <br />

        {/*<br />*/}
        {/*<Card bordered={false}>*/}
        {/*  <FormItem {...formItemLayout} label={<FormattedMessage id="contract.project_name.label" />}>*/}
        {/*    {getFieldDecorator('project_name', {*/}
        {/*      rules: [*/}
        {/*        {*/}
        {/*          required: true,*/}
        {/*          message: formatMessage({ id: 'validation.project_name.required' }),*/}
        {/*        },*/}
        {/*      ],*/}
        {/*    })(<Input placeholder={formatMessage({ id: 'contract.project_name.placeholder' })} />)}*/}
        {/*  </FormItem>*/}
        {/*  <FormItem {...formItemLayout} label={<FormattedMessage id="contract.sign_data.label" />}>*/}
        {/*    <DatePicker defaultValue={moment('2019/01/01', dateFormat)} format={dateFormat} />*/}
        {/*  </FormItem>*/}
        {/*</Card>*/}
        {/*<br />*/}
        {/*<Card bordered={false}>*/}
        {/*  <h1>一、任务表述</h1>*/}
        {/*  <br />*/}
        {/*  <h1>*/}
        {/*    乙方按照国家软件质量测试标准和测试规范，完成甲方委托的软件<Input  placeholder="这个框好像有点太大了"/>(下称受测软件)的质量特性<Input  placeholder="但是我不知道怎么调"/>，进行测试，并出具相应的测试报告。*/}
        {/*  </h1>*/}
        {/*</Card>*/}
        {/*<br />*/}
        {/*<Card bordered={false}>*/}
        {/*</Card>*/}
        {/*<Card>*/}
        {/*  <h2>十二、签章</h2>*/}
        {/*</Card>*/}
        {/*<Card>*/}
        {/*  <h1>委托方</h1>*/}
        {/*  <FormItem {...formItemLayout} label={<FormattedMessage id="这里写一写" />}>*/}
        {/*    {getFieldDecorator('project_name', {*/}
        {/*      rules: [*/}
        {/*        {*/}
        {/*          required: true,*/}
        {/*          message: formatMessage({ id: '写一写' }),*/}
        {/*        },*/}
        {/*      ],*/}
        {/*    })(<Input placeholder={formatMessage({ id: '这里写一写' })} />)}*/}
        {/*  </FormItem>*/}
        {/*</Card>*/}
        {/*<Card>*/}
        {/*  <h1>受托方</h1>*/}
        {/*  <FormItem {...formItemLayout} label={<FormattedMessage id="这里写一写" />}>*/}
        {/*    {getFieldDecorator('project_name', {*/}
        {/*      rules: [*/}
        {/*        {*/}
        {/*          required: true,*/}
        {/*          message: formatMessage({ id: '写一写' }),*/}
        {/*        },*/}
        {/*      ],*/}
        {/*    })(<Input placeholder={formatMessage({ id: '这里写一写' })} />)}*/}
        {/*  </FormItem>*/}
        {/*</Card>*/}

        <FormItem {...submitFormLayout} style={{ marginTop: 32 }}>
          <Button type="primary" onClick={showConfirm}>
            <FormattedMessage id="basic-form.form.submit" />
          </Button>
          <Button style={{ marginLeft: 8 }}>
            <FormattedMessage id="basic-form.form.save" />
          </Button>
          <Button style={{ marginLeft: 8}} type="danger" onClick={showDeleteConfirm}>
            <FormattedMessage id="basic-form.form.delete" />
          </Button>
        </FormItem>
      </div>
    );
  }
}

export default BasicForm;