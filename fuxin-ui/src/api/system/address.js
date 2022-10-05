import request from '@/utils/request'

// 查询收货地址列表
export function listAddress(query) {
  return request({
    url: '/system/address/list',
    method: 'get',
    params: query
  })
}

// 查询收货地址详细
export function getAddress(addressId) {
  return request({
    url: '/system/address/' + addressId,
    method: 'get'
  })
}

// 新增收货地址
export function addAddress(data) {
  return request({
    url: '/system/address',
    method: 'post',
    data: data
  })
}

// 修改收货地址
export function updateAddress(data) {
  return request({
    url: '/system/address',
    method: 'put',
    data: data
  })
}

// 删除收货地址
export function delAddress(addressId) {
  return request({
    url: '/system/address/' + addressId,
    method: 'delete'
  })
}
