import request from '@/utils/request'

// 查询订单商品详情列表
export function listOrderdetail(query) {
  return request({
    url: '/system/orderdetail/list',
    method: 'get',
    params: query
  })
}

// 查询订单商品详情详细
export function getOrderdetail(orderDetailId) {
  return request({
    url: '/system/orderdetail/' + orderDetailId,
    method: 'get'
  })
}

// 新增订单商品详情
export function addOrderdetail(data) {
  return request({
    url: '/system/orderdetail',
    method: 'post',
    data: data
  })
}

// 修改订单商品详情
export function updateOrderdetail(data) {
  return request({
    url: '/system/orderdetail',
    method: 'put',
    data: data
  })
}

// 删除订单商品详情
export function delOrderdetail(orderDetailId) {
  return request({
    url: '/system/orderdetail/' + orderDetailId,
    method: 'delete'
  })
}
