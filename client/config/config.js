// ref: https://umijs.org/config/
import {primaryColor} from '../src/defaultSettings';

export default {
  base:'/',
  publicPath: 'http://localhost:8080/',
  treeShaking: true,
  exportStatic:{
    htmlSuffix:true,
  },
  plugins: [
    [
      'umi-plugin-react',
      {
        antd: true,
        dva: {hmr: true},
        targets: {ie: 11},
        locale: {
          enable: true,
          // default false
          default: 'zh-CN',
          // default zh-CN
          baseNavigator: true,
        },
        // default true, when it is true, will use `navigator.language` overwrite default
        dynamicImport: {loadingComponent: './components/PageLoading/index'},
      },
    ],
    [
      'umi-plugin-pro-block',
      {
        moveMock: false,
        moveService: false,
        modifyRequest: true,
        autoAddMenu: true,
      },
    ],
  ],
  targets: {ie: 11},
  /**
   * 路由相关配置
   */
  routes: [{
    path: '/',
    component: '../layouts/BasicLayout',
    routes: [
      {
        path: '/',
        redirect: '/welcome',
      },
      // dashboard
      {
        path: '/welcome',
        name: 'welcome',
        icon: 'smile',
        component: './Welcome',
      },
      // {
      //   path: 'https://github.com/umijs/umi-blocks/tree/master/ant-design-pro',
      //   name: 'more-blocks',
      //   icon: 'block',
      // },
      {
        //name: 'basic-form',
        //icon: 'dashboard',
        path: '/basic-form',
        component: './entrust/basic-form',
      },
      //entrustlist
      {
        name: '您的委托',
        icon: 'pie-chart',
        path: '/basic-list',
        component: './entrust/basic-list/entrustlist',
      },
      {
        //name: '委托详情',
        path: '/basic-check',
        component: './entrust/basic-check',
      },
      {
        name: '您的合同详情',
        icon: 'pie-chart',
        path: '/contract_detail',
        component: './contract/contract_detail',
      },
      {
        name: '您的合同列表',
        icon: 'pie-chart',
        path: '/contract_list',
        component: './contract/contract_list',
      },
      {
        name: '您的合同编辑',
        icon: 'pie-chart',
        path: '/contract_edit',
        component: './contract/contract_edit',
      },
    ],
  },
  ],
  disableRedirectHoist: true,
  /**
   * webpack 相关配置
   */
  define: {APP_TYPE: process.env.APP_TYPE || ''},
  // Theme for antd
  // https://ant.design/docs/react/customize-theme-cn
  theme: {'primary-color': primaryColor},
  externals: {'@antv/data-set': 'DataSet'},
  ignoreMomentLocale: true,
  lessLoaderOptions: {javascriptEnabled: true},
  proxy: {
    '/api': {
      target: 'http://localhost:8080',
      changeOrigin: true,
    }
  }
};
