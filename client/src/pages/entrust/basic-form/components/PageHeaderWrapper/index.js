import React from 'react';
import { FormattedMessage } from 'umi/locale';
import Link from 'umi/link';
import { PageHeader } from 'ant-design-pro';
import styles from './index.less';

const PageHeaderWrapper = ({ children, wrapperClassName, ...restProps }) => (
  <div  className={wrapperClassName}>
    <PageHeader
      home={<FormattedMessage id="basic-form.menu.home" defaultMessage="Home" />}
      key="pageheader"
      {...restProps}
      linkElement={Link}
      itemRender={item => {
        if (item.locale) {
          return <FormattedMessage id={item.locale} defaultMessage={item.title} />;
        }
        return item.title;
      }}
    />
    {children ? <div className={styles.content}>{children}</div> : null}
  </div>
);

export default PageHeaderWrapper;
