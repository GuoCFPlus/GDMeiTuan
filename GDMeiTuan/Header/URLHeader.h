//
//  URLHeader.h
//  CBayelProjectManage
//
//  Created by gcf on 16/3/28.
//  Copyright © 2016年 CBayel. All rights reserved.
//  这里是URL信息

#ifndef Project_URLHeader_h
#define Project_URLHeader_h

//服务器地址
//开发版 @"http://101.201.78.207:8081"
//#define URL_Server @"http://appserver.cbayel.com:8081"
#define URL_Server @"https://zyj.cbayel.com:8444"
//测试版
//#define URL_Server @"http://lms-apptest.cm-ifl.com"
//生产版
//#define URL_Server @"http://lms-app.cm-ifl.com"

//登录URL:loginName：wangrong     password：511B0D5F341BDDBD9A5348923B48D14C
#define URL_Login /lbms/rbac/mLoginAction.do
//退出URL：http://{{host}}/lbms/api/user/logout?p_token=11111&userName=zhujingmin
#define URL_Logout /lbms/api/user/logout

//待办事项列表页URL:@"http://101.201.78.207:8081/lbms/pm/flow/mWorkList.do?operAtt=todoTaskList"
#define URL_ToDo /lbms/pm/flow/mWorkList.do?operAtt=todoTaskList
//待办事项详细页测试URL:@"http://101.201.78.207:8081/lbms/mobile/Project_approval_process.html"
#define URL_ToDoDetail /lbms/mobile/Project_approval_process.html

//流程查询列表页URL
//未结束流程:@"http://101.201.78.207:8081/lbms/pm/flow/workList.do?footer.page=1&footer.pageSize=50&operAtt=mPassUnclosedTask"
#define URL_FlowUnclosed  /lbms/pm/flow/workList.do
//已结束流程:@"http://101.201.78.207:8081/lbms/pm/flow/workList.do?footer.page=1&footer.pageSize=50&operAtt=mPassClosedTask"
#define URL_FlowClosed /lbms/pm/flow/workList.do
//流程查询详细页测试URL:@"http://101.201.78.207:8081/lbms/mobile/Process_query.html"
#define URL_FlowDetail /lbms/mobile/Process_query.html

//项目查询列表页URL:@"http://101.201.78.207:8081/lbms/la/compositiveInfoQueryAction.do?footer.page=1&footer.pageSize=50&operAtt=mQuery"
#define URL_Project /lbms/la/compositiveInfoQueryAction.do
//项目查询详细页测试URL:@"http://101.201.78.207:8081/lbms/mobile/Projectmore.html"
#define URL_ProjectDetail /lbms/mobile/Projectmore.html


//合同查询列表页URL:@"http://101.201.78.207:8081/lbms/cs/contractInformationQueryAction.do?footer.page=1&footer.pageSize=50&operAtt=mQuery"
#define URL_Contract /lbms/cs/contractInformationQueryAction.do
//合同查询详细页测试URL:@"http://101.201.78.207:8081/lbms/mobile/Contract_inquiry.html"
#define URL_ContractDetail /lbms/mobile/Contract_inquiry.html

//放款查询列表页URL:@"http://101.201.78.207:8081/lbms/gl/payInfoQueryAction.do?footer.page=1&footer.pageSize=50&operAtt=mQuery"
#define URL_Lending /lbms/gl/payInfoQueryAction.do
//放款查询详细页测试URL:@"http://101.201.78.207:8081/lbms/mobile/Loan_inquiry.html"
#define URL_LendingDetail /lbms/mobile/Loan_inquiry.html

//收款查询列表页URL:@"http://101.201.78.207:8081/lbms/la/repayQueryAction.do?footer.page=1&footer.pageSize=50&operAtt=mQuery"
//#define URL_Collection @"http://101.201.78.207:8081/lbms/la/repayQueryAction.do?footer.page=%d&footer.pageSize=%d&operAtt=mQuery"
#define URL_Collection /lbms/la/repayQueryAction.do
//收款查询详细页测试URL:@"http://101.201.78.207:8081/lbms/mobile/Collection_inquiry.html"
#define URL_CollectionDetail /lbms/mobile/Collection_inquiry.html

//逾期查询列表页URL:@"http://101.201.78.207:8081/lbms/gl/overdueProjectQueryAction.do?footer.page=1&footer.pageSize=50&operAtt=mQuery"
#define URL_TimeOut /lbms/gl/overdueProjectQueryAction.do
#define URL_TimeOutDetail /lbms/mobile/Late_query.html

//拼接网址
#define URL_Concat(x) URL_Helper(x)
#define URL_Helper(x) URL_Server#x



/**
 *  资金系统
 */
//开发版
//#define URL_ServerFund @"http://appserver.cbayel.com:8080"
#define URL_ServerFund @"https://zyj.cbayel.com:8443"
//测试版
//#define URL_ServerFund @"http://21.193.56.19:8080"
//#define URL_ServerFund @"http://cms-apptest.cm-ifl.com"
//生产版
//#define URL_ServerFund @"http://cms-app.cm-ifl.com"

//登录URL
#define URL_LoginFund /leasecore/api/login
#define URL_LogoutFund /leasecore/api/user/logout
//翻译字典
#define URL_FundDictionary /leasecore/api/refobj/dict/name?name=fm

//待办事项列表页URL:@"http://192.168.1.139:8085/leasecore/api/act/task/todo/app"
#define URL_ToDoFund /leasecore/api/act/task/todo/app
//待办事项详细页URL
//融资合同审批流程
#define URL_HbAudit /leasecore/fundAPP/html/contract_approval_process.html
//内部借款
#define URL_InternalBorrow /leasecore/fundAPP/html/Internal_borrowing.html
//资金调拨
#define URL_InternalFundTransfer /leasecore/fundAPP/html/Internal_fund_allocation.html
//公章证照
#define URL_FundSpecial /leasecore/fundAPP/html/Official_license.html

//流程查询列表页
//#define URL_FlowUnclosedFund /leasecore/api/act/task/unfinishedProcess
//#define URL_FlowClosedFund /leasecore/api/act/task/finishedProcess
#define URL_FlowFund /leasecore/api/act/task/involvedProcess
#define URL_FlowDetailFund /leasecore/fundAPP/html/Process_query.html

#define URL_FlowDetailFundLocal @"/Process_query.html"

//还本付息列表页
#define URL_Servicing /leasecore/api/fm/getRepayList
#define URL_ServicingDel /leasecore/api/fm/updateAppInd
#define URL_ServicingDetail /leasecore/fundAPP/html/Pay_all.html

#define URL_ServicingDetailLocal @"/Pay_all.html"


//资金系统拼接网址
#define URL_ConcatFund(x) URL_HelperFund(x)
#define URL_HelperFund(x) URL_ServerFund#x


/**
 *  费控系统
 */
//RAP
//#define URL_ServerCost @"http://101.201.78.207:8082/mockjs/1"
//测试版test http://21.193.56.16:8081/sshuser_zmtfygk/
#define URL_ServerCost @"http://fms-apptest.cm-ifl.com/sshuser_zmtfygk/"
//生产版
//#define URL_ServerCost @"http://fms-app.cm-ifl.com/sshuser_zmtfygk/"
/*
//登录URL
#define URL_LoginCost /login
#define URL_LogoutCost /logout

//我的单据列表页
#define URL_Document /danjulist
//我的单据-费用报销单详细页
#define URL_ExpenseDetail /expense.html
//我的单据-差旅费报销单详细页
#define URL_TravelDetail /travel.html
//我的单据-出差申请单详细页
#define URL_TravelApplicationDetail /travel_application.html
//我的单据-借款单详细页
#define URL_BorrowMoneyDetail /borrow_money.html

//我的单据-费用报销单详细页
#define URL_ExpenseDetailLocal @"/expense.html"
//我的单据-差旅费报销单详细页
#define URL_TravelDetailLocal @"/travel.html"
//我的单据-出差申请单详细页
#define URL_TravelApplicationDetailLocal @"/travel_application.html"
//我的单据-借款单详细页
#define URL_BorrowMoneyDetailLocal @"/borrow_money.html"

//我的额度列表页
#define URL_Quota /gerenedu

//待办任务列表页
#define URL_Gtasks /daibanrenwu

//已办任务列表页
#define URL_DoneTask /yibanrenwu
*/
//登录URL
#define URL_LoginCost apploginAction!Applogin.action
#define URL_LogoutCost applogoutAction!Applogout.action

//我的单据列表页
#define URL_Document alllistAction!Alllist.action
//我的单据-费用报销单详细页
#define URL_ExpenseDetail IOSAPP/expense.html
//我的单据-差旅费报销单详细页
#define URL_TravelDetail IOSAPP/travel.html
//我的单据-出差申请单详细页
#define URL_TravelApplicationDetail IOSAPP/travel_application.html
//我的单据-借款单详细页
#define URL_BorrowMoneyDetail IOSAPP/borrow_money.html

//我的单据-费用报销单详细页
#define URL_ExpenseDetailLocal @"/expense.html"
//我的单据-差旅费报销单详细页
#define URL_TravelDetailLocal @"/travel.html"
//我的单据-出差申请单详细页
#define URL_TravelApplicationDetailLocal @"/travel_application.html"
//我的单据-借款单详细页
#define URL_BorrowMoneyDetailLocal @"/borrow_money.html"

//我的额度列表页
#define URL_Quota eduAction!Educhaxun.action

//待办任务列表页
#define URL_Gtasks shenpiAction!Alllist.action

//已办任务列表页
#define URL_DoneTask yibanrenwuAction!YiBanAlllist.action
//资金系统拼接网址
#define URL_ConcatCost(x) URL_HelperCost(x)
#define URL_HelperCost(x) URL_ServerCost#x

#endif
