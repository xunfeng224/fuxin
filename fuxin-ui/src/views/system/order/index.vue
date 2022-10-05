<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="客户账号" prop="cusId">
        <el-input
          v-model="queryParams.cusName"
          placeholder="请输入客户编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单单号" prop="orderNo">
        <el-input
          v-model="queryParams.orderNo"
          placeholder="请输入订单单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="订单状态" prop="orderStatus">
        <el-select v-model="queryParams.orderStatus" placeholder="请选择订单状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_order_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="付款时间">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:order:add']"
        >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:order:edit']"
        >修改
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:order:remove']"
        >删除
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:order:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>

      <!--展开详情-->
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="center" inline class="order-detail-expand">
            <el-form-item label="订单编号">
              <span>{{ props.row.orderId }}</span>
            </el-form-item>
            <el-form-item label="客户编号">
              <span>{{ props.row.cusId }}</span>
            </el-form-item>
            <el-form-item label="客户账号">
              <span>{{ props.row.cusName }}</span>
            </el-form-item>
            <el-form-item label="商品项目数量">
              <span>{{ props.row.productCount }}</span>
            </el-form-item>
            <el-form-item label="商品总价">
              <span>{{ props.row.productAmountTotal }}</span>
            </el-form-item>
            <el-form-item label="运费金额">
              <span>{{ props.row.logisticsFee }}</span>
            </el-form-item>
            <el-form-item label="创建时间">
              <span>{{ props.row.createTime }}</span>
            </el-form-item>
            <el-form-item label="创建者">
              <span>{{ props.row.createBy }}</span>
            </el-form-item>
            <el-form-item label="更新时间">
              <span>{{ props.row.updateTime }}</span>
            </el-form-item>
            <el-form-item label="更新者">
              <span>{{ props.row.updateBy }}</span>
            </el-form-item>
            <el-form-item label="备注">
              <span>{{ props.row.remark }}</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>

      <el-table-column label="订单单号" align="center" prop="orderNo"/>
      <el-table-column label="订单状态" align="center" prop="orderStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_order_status" :value="scope.row.orderStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="订单金额" align="center" prop="orderAmountTotal"/>
      <el-table-column label="收货地址编号" align="center" prop="addressId"/>
      <el-table-column label="订单物流编号" align="center" prop="orderlogisticsId"/>
      <el-table-column label="订单支付渠道" align="center" prop="payChannel">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_pay_channel" :value="scope.row.payChannel"/>
        </template>
      </el-table-column>
      <el-table-column label="订单支付单号" align="center" prop="outTradeNo"/>
      <el-table-column label="付款时间" align="center" prop="payTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.payTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="发货时间" align="center" prop="deliveryTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.deliveryTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="订单结算时间" align="center" prop="orderSettlementTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.orderSettlementTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleQueryOrderDetail(scope.row)"
            v-hasPermi="['system:order:queryOrderDetail']"
          >订单详情
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleQueryAddress(scope.row)"
            v-hasPermi="['system:order:queryAddress']"
          >收货地址
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:order:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:order:remove']"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改订单对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单状态">
          <el-radio-group v-model="form.orderStatus">
            <el-radio
              v-for="dict in dict.type.sys_order_status"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{ dict.label }}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="商品项目数量" prop="productCount">
          <el-input v-model="form.productCount" placeholder="请输入商品项目数量"/>
        </el-form-item>
        <el-form-item label="商品总价" prop="productAmountTotal">
          <el-input v-model="form.productAmountTotal" placeholder="请输入商品总价"/>
        </el-form-item>
        <el-form-item label="订单金额" prop="orderAmountTotal">
          <el-input v-model="form.orderAmountTotal" placeholder="请输入订单金额"/>
        </el-form-item>
        <el-form-item label="运费金额" prop="logisticsFee">
          <el-input v-model="form.logisticsFee" placeholder="请输入运费金额"/>
        </el-form-item>
        <el-form-item label="收货地址编号" prop="addressId">
          <el-input v-model="form.addressId" placeholder="请输入收货地址编号"/>
        </el-form-item>
        <el-form-item label="订单物流编号" prop="orderlogisticsId">
          <el-input v-model="form.orderlogisticsId" placeholder="请输入订单物流编号"/>
        </el-form-item>
        <el-form-item label="订单支付渠道" prop="payChannel">
          <el-input v-model="form.payChannel" placeholder="请输入订单支付渠道"/>
        </el-form-item>
        <el-form-item label="订单支付单号" prop="outTradeNo">
          <el-input v-model="form.outTradeNo" placeholder="请输入订单支付单号"/>
        </el-form-item>
        <el-form-item label="付款时间" prop="payTime">
          <el-date-picker clearable
                          v-model="form.payTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择付款时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="发货时间" prop="deliveryTime">
          <el-date-picker clearable
                          v-model="form.deliveryTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择发货时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="客户编号" prop="cusId">
          <el-input v-model="form.cusId" placeholder="请输入客户编号"/>
        </el-form-item>
        <el-form-item label="客户备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容"/>
        </el-form-item>
        <el-form-item label="订单结算时间" prop="orderSettlementTime">
          <el-date-picker clearable
                          v-model="form.orderSettlementTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择订单结算时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!-- 查看收货地址信息框 -->
    <el-dialog :title="title" :visible.sync="dialogTableAddressInfo" center >
      <el-table :data="address">
        <el-table-column label="收件人姓名" align="center" prop="realname" />
        <el-table-column label="联系电话" align="center" prop="telphone" />
        <el-table-column label="备用联系电话" align="center" prop="telphone2" />
        <el-table-column label="国家" align="center" prop="country" />
        <el-table-column label="省份" align="center" prop="province" />
        <el-table-column label="城市" align="center" prop="city" />
        <el-table-column label="地区" align="center" prop="area" />
        <el-table-column label="街道/详细收获地址" align="center" prop="street"  />
        <el-table-column label="邮政编码" align="center" prop="zip" />
        <el-table-column label="默认收货地址" align="center" prop="isDefaultAddress" >
          <template slot-scope="scope">
            <dict-tag :options="dict.type.is_default_address" :value="scope.row.isDefaultAddress"/>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogTableAddressInfo = false">取 消</el-button>
        <el-button type="primary" @click="dialogTableAddressInfo = false">确 定</el-button>
      </div>
    </el-dialog>

    <!-- 查看订单详情框 -->
    <el-dialog :title="title" :visible.sync="orderDetail" center >
      <el-table :data="orderDetailData">
        <el-table-column label="订单编号" align="center" prop="orderId" />
        <el-table-column label="订单单号" align="center" prop="orderNo" />
        <el-table-column label="商品编号" align="center" prop="productId" />
        <el-table-column label="商品名称" align="center" prop="productName" />
        <el-table-column label="商品价格" align="center" prop="productPrice" />
        <el-table-column label="商品型号" align="center" prop="productMarque" />
        <el-table-column label="商品仓库条码" align="center" prop="productStoreBarcode" />
        <el-table-column label="商品型号信息" align="center" prop="productModeDesc" />
        <el-table-column label="商品型号参数" align="center" prop="productModeParams" />
        <el-table-column label="折扣比例" align="center" prop="discountRate" />
        <el-table-column label="折扣金额" align="center" prop="discountAmount" />
        <el-table-column label="购买数量" align="center" prop="number" />
        <el-table-column label="总金额" align="center" prop="subtotal" />
        <el-table-column label="商品状态" align="center" prop="isProductExists">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.is_product_exists" :value="scope.row.isProductExists"/>
          </template>
        </el-table-column>
        <el-table-column label="客户备注" align="center" prop="remark" />
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="orderDetail = false">取 消</el-button>
        <el-button type="primary" @click="orderDetail = false">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<style>
.order-detail-expand {
  font-size: 0;
}

.order-detail-expand label {
  width: 100px;
  color: #99a9bf;
}

.order-detail-expand .el-form-item {
  margin-left: 200px;
  margin-right: 0;
  margin-bottom: 0;
  width: 30%;
}
</style>
<script>
import {listOrder, getOrder, delOrder, addOrder, updateOrder,getAddressInfo,getOrderDetail} from "@/api/system/order";

export default {
  name: "Order",
  dicts: ['sys_order_status', 'sys_pay_channel','is_default_address','is_product_exists'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 订单表格数据
      orderList: [],
      //收货地址表单数据
      address:[],
      //订单详情数据
      orderDetailData:[],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      dialogTableAddressInfo: false,
      orderDetail: false,
      // 日期范围
      dateRange: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderNo: null,
        orderStatus: null,
        productCount: null,
        productAmountTotal: null,
        orderAmountTotal: null,
        logisticsFee: null,
        addressId: null,
        orderlogisticsId: null,
        payChannel: null,
        outTradeNo: null,
        payTime: null,
        deliveryTime: null,
        cusId: null,
        cusName: null,
        orderSettlementTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {}
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询订单列表 */
    getList() {
      this.loading = true;
      listOrder(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
        this.orderList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        orderId: null,
        orderNo: null,
        orderStatus: 0,
        productCount: null,
        productAmountTotal: null,
        orderAmountTotal: null,
        logisticsFee: null,
        addressId: null,
        orderlogisticsId: null,
        payChannel: null,
        outTradeNo: null,
        createBy: null,
        createTime: null,
        payTime: null,
        deliveryTime: null,
        cusId: null,
        remark: null,
        orderSettlementTime: null,
        delFlag: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单";
    },
    /**查看订单详情*/
    handleQueryOrderDetail(row) {
      this.reset();
      const orderId = row.orderId || this.orderId
      getOrderDetail(orderId).then(response=>{
        this.orderDetailData = response.data;
        if (this.orderDetailData.length == 0) {
          this.$message('未查询到相关订单详情信息');
        } else{
          this.orderDetail = true;
          this.title = "订单详情";
        }
      });

    },
    /**查看订单的收获地址信息*/
    handleQueryAddress(row) {
      this.reset();
      const addressId = row.addressId || this.addressId
      getAddressInfo(addressId).then(response=>{
        this.address = response.data;
        if (this.address.length == 0) {
          this.$message('未查询到相关收货地址信息');
        } else{
          this.dialogTableAddressInfo = true;
          this.title = "收货地址信息查看";
        }
      });

    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const orderId = row.orderId || this.ids
      getOrder(orderId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.orderId != null) {
            updateOrder(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrder(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const orderIds = row.orderId || this.ids;
      this.$modal.confirm('是否确认删除订单编号为"' + orderIds + '"的数据项？').then(function () {
        return delOrder(orderIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/order/export', {
        ...this.queryParams
      }, `order_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
