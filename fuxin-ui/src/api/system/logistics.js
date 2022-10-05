import request from '@/utils/request'

// 查询订单物流列表
export function listLogistics(query) {
  return request({
    url: '/system/logistics/list',
    method: 'get',
    params: query
  })
}

// 查询订单物流详细
export function getLogistics(orderlogisticsId) {
  return request({
    url: '/system/logistics/' + orderlogisticsId,
    method: 'get'
  })
}

// 新增订单物流
export function addLogistics(data) {
  return request({
    url: '/system/logistics',
    method: 'post',
    data: data
  })
}

// 修改订单物流
export function updateLogistics(data) {
  return request({
    url: '/system/logistics',
    method: 'put',
    data: data
  })
}

// 删除订单物流
export function delLogistics(orderlogisticsId) {
  return request({
    url: '/system/logistics/' + orderlogisticsId,
    method: 'delete'
  })
}
