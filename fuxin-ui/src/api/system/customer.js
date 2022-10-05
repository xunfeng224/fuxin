import request from '@/utils/request'

// 查询客户信息列表
export function listCustomer(query) {
  return request({
    url: '/system/customer/list',
    method: 'get',
    params: query
  })
}

// 查询客户信息详细
export function getCustomer(cusId) {
  return request({
    url: '/system/customer/' + cusId,
    method: 'get'
  })
}

// 新增客户信息
export function addCustomer(data) {
  return request({
    url: '/system/customer',
    method: 'post',
    data: data
  })
}
//查看客户订单
export function getCustomerOrder(cusId) {
  return request({
    url:'/system/customer/getCustomerOrder/'+cusId,
    method: 'get',
  })
}

// 修改客户信息
export function updateCustomer(data) {
  return request({
    url: '/system/customer',
    method: 'put',
    data: data
  })
}

// 删除客户信息
export function delCustomer(cusId) {
  return request({
    url: '/system/customer/' + cusId,
    method: 'delete'
  })
}

// 客户状态修改
export function changeCusStatus(cusId, status) {
  const data = {
    cusId,
    status
  }
  return request({
    url: '/system/customer/changeStatus',
    method: 'put',
    data: data
  })
}
