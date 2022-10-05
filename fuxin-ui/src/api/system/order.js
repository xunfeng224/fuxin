import request from '@/utils/request'

// 查询订单列表
export function listOrder(query) {
  return request({
    url: '/system/order/list',
    method: 'get',
    params: query
  })
}

// 查询订单详细
export function getOrder(orderId) {
  return request({
    url: '/system/order/' + orderId,
    method: 'get'
  })
}

// 新增订单
export function addOrder(data) {
  return request({
    url: '/system/order',
    method: 'post',
    data: data
  })
}

//查看收货地址信息
export function getAddressInfo(addressId) {
  return request({
    url: '/system/order/getAddressInfo/' + addressId,
    method: 'get',
  })
}


//查看订单详情
export function getOrderDetail(orderId) {
  return request({
    url: '/system/order/getOrderDetail/' + orderId,
    method: 'get',
  })
}

// 修改订单
export function updateOrder(data) {
  return request({
    url: '/system/order',
    method: 'put',
    data: data
  })
}

// 删除订单
export function delOrder(orderId) {
  return request({
    url: '/system/order/' + orderId,
    method: 'delete'
  })
}
