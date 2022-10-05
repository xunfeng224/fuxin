<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="订单编号" prop="orderId">
        <el-input
          v-model="queryParams.orderId"
          placeholder="请输入订单编号"
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
      <el-form-item label="物流单号" prop="expressNo">
        <el-input
          v-model="queryParams.expressNo"
          placeholder="请输入物流单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="收货人姓名" prop="consigneeRealname" label-width="100px">
        <el-input
          v-model="queryParams.consigneeRealname"
          placeholder="请输入收货人姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="联系电话" prop="consigneeTelphone">
        <el-input
          v-model="queryParams.consigneeTelphone"
          placeholder="请输入联系电话"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物流方式" prop="logisticsType">
        <el-select v-model="queryParams.logisticsType" placeholder="请选择物流方式" clearable>
          <el-option
            v-for="dict in dict.type.logistics_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="物流商家编号" prop="logisticsId" label-width="100px">
        <el-input
          v-model="queryParams.logisticsId"
          placeholder="请输入物流商家编号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="物流状态" prop="orderlogisticsStatus">
        <el-select v-model="queryParams.orderlogisticsStatus" placeholder="请选择物流状态" clearable>
          <el-option
            v-for="dict in dict.type.order_logistics_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="物流发货时间" label-width="100px">
        <el-date-picker
          v-model="daterangeLogisticsCreateTime"
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
          v-hasPermi="['system:logistics:add']"
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
          v-hasPermi="['system:logistics:edit']"
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
          v-hasPermi="['system:logistics:remove']"
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
          v-hasPermi="['system:logistics:export']"
        >导出
        </el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="logisticsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center"/>
      <!--展开详情-->
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="center" inline class="logistics-detail-expand">

            <el-form-item label="物流单编号">
              <span>{{ props.row.orderlogisticsId }}</span>
            </el-form-item>
            <el-form-item label="收货人姓名">
              <span>{{ props.row.consigneeRealname }}</span>
            </el-form-item>
            <el-form-item label="收货人电话">
              <span>{{ props.row.consigneeTelphone }}</span>
            </el-form-item>
            <el-form-item label="备用电话">
              <span>{{ props.row.consigneeTelphone2 }}</span>
            </el-form-item>
            consigneeAddress
            <el-form-item label="收货地址">
              <span>{{ props.row.consigneeAddress }}</span>
            </el-form-item>
            <el-form-item label="邮政编码">
              <span>{{ props.row.consigneZip }}</span>
            </el-form-item>
            <el-form-item label="物流更新时间">
              <span>{{ parseTime(props.row.logisticsUpdateTime, '{y}-{m}-{d}') }}</span>
            </el-form-item>
            <el-form-item label="物流结算时间">
              <span>{{ parseTime(props.row.logisticsSettlementTime, '{y}-{m}-{d}') }}</span>
            </el-form-item>
            <el-form-item label="物流支付渠道">
              <template slot-scope="scope">
                <dict-tag :options="dict.type.sys_pay_channel" :value="props.row.logisticsPayChannel"/>
              </template>
            </el-form-item>
            <el-form-item label="物流支付单号">
              <span>{{ props.row.outTradeNo }}</span>
            </el-form-item>
          </el-form>
        </template>
      </el-table-column>

      <!--      <el-table-column label="物流表id" align="center" prop="orderlogisticsId" />-->
      <el-table-column label="订单编号" align="center" prop="orderId"/>
      <el-table-column label="订单单号" align="center" prop="orderNo"/>
      <el-table-column label="物流单号" align="center" prop="expressNo"/>
      <!--      <el-table-column label="收货人姓名" align="center" prop="consigneeRealname" />-->
      <!--      <el-table-column label="联系电话" align="center" prop="consigneeTelphone" />-->
      <!--      <el-table-column label="备用联系电话" align="center" prop="consigneeTelphone2" />-->
      <!--      <el-table-column label="收货地址" align="center" prop="consigneeAddress" />-->
      <!--      <el-table-column label="邮政编码" align="center" prop="consigneZip" />-->
      <el-table-column label="物流方式" align="center" prop="logisticsType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.logistics_type" :value="scope.row.logisticsType"/>
        </template>
      </el-table-column>
      <el-table-column label="物流商家编号" align="center" prop="logisticsId"/>
      <el-table-column label="物流发货运费" align="center" prop="logisticsFee"/>
      <el-table-column label="付款金额" align="center" prop="deliveryAmount"/>
      <el-table-column label="物流状态" align="center" prop="orderlogisticsStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.order_logistics_status" :value="scope.row.orderlogisticsStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="物流结算状态" align="center" prop="logisticsSettlementStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.logistics_settlement_status" :value="scope.row.logisticsSettlementStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="物流描述" align="center" prop="logisticsResult"/>
      <el-table-column label="物流发货时间" align="center" prop="logisticsCreateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.logisticsCreateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <!--      <el-table-column label="物流更新时间" align="center" prop="logisticsUpdateTime" width="180">-->
      <!--        <template slot-scope="scope">-->
      <!--          <span>{{ parseTime(scope.row.logisticsUpdateTime, '{y}-{m}-{d}') }}</span>-->
      <!--        </template>-->
      <!--      </el-table-column>-->
      <!--      <el-table-column label="物流结算时间" align="center" prop="logisticsSettlementTime" width="180">-->
      <!--        <template slot-scope="scope">-->
      <!--          <span>{{ parseTime(scope.row.logisticsSettlementTime, '{y}-{m}-{d}') }}</span>-->
      <!--        </template>-->
      <!--      </el-table-column>-->

      <!--      <el-table-column label="物流订单支付单号" align="center" prop="outTradeNo" />-->
      <el-table-column label="物流公司对账状态" align="center" prop="reconciliationStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.reconciliation_status" :value="scope.row.reconciliationStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="物流公司对账日期" align="center" prop="reconciliationTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.reconciliationTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:logistics:edit']"
          >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:logistics:remove']"
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

    <!-- 添加或修改订单物流对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单编号" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入订单编号"/>
        </el-form-item>
        <el-form-item label="物流单号" prop="expressNo">
          <el-input v-model="form.expressNo" placeholder="请输入物流单号"/>
        </el-form-item>
        <el-form-item label="收货人姓名" prop="consigneeRealname">
          <el-input v-model="form.consigneeRealname" placeholder="请输入收货人姓名"/>
        </el-form-item>
        <el-form-item label="联系电话" prop="consigneeTelphone">
          <el-input v-model="form.consigneeTelphone" placeholder="请输入联系电话"/>
        </el-form-item>
        <el-form-item label="备用联系电话" prop="consigneeTelphone2">
          <el-input v-model="form.consigneeTelphone2" placeholder="请输入备用联系电话"/>
        </el-form-item>
        <el-form-item label="收货地址" prop="consigneeAddress">
          <el-input v-model="form.consigneeAddress" placeholder="请输入收货地址"/>
        </el-form-item>
        <el-form-item label="邮政编码" prop="consigneZip">
          <el-input v-model="form.consigneZip" placeholder="请输入邮政编码"/>
        </el-form-item>
        <el-form-item label="物流方式" prop="logisticsType">
          <el-select v-model="form.logisticsType" placeholder="请选择物流方式">
            <el-option
              v-for="dict in dict.type.logistics_type"
              :key="dict.value"
              :label="dict.label"
              :value="parseInt(dict.value)"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="物流商家编号" prop="logisticsId">
          <el-input v-model="form.logisticsId" placeholder="请输入物流商家编号"/>
        </el-form-item>
        <el-form-item label="物流发货运费" prop="logisticsFee">
          <el-input v-model="form.logisticsFee" placeholder="请输入物流发货运费"/>
        </el-form-item>
        <el-form-item label="付款金额" prop="deliveryAmount">
          <el-input v-model="form.deliveryAmount" placeholder="请输入付款金额"/>
        </el-form-item>
        <el-form-item label="物流状态">
          <el-radio-group v-model="form.orderlogisticsStatus">
            <el-radio
              v-for="dict in dict.type.order_logistics_status"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{ dict.label }}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="物流描述" prop="logisticsResult">
          <el-input v-model="form.logisticsResult" placeholder="请输入物流描述"/>
        </el-form-item>
        <el-form-item label="物流发货时间" prop="logisticsCreateTime">
          <el-date-picker clearable
                          v-model="form.logisticsCreateTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择物流发货时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="物流更新时间" prop="logisticsUpdateTime">
          <el-date-picker clearable
                          v-model="form.logisticsUpdateTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择物流更新时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="物流结算时间" prop="logisticsSettlementTime">
          <el-date-picker clearable
                          v-model="form.logisticsSettlementTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择物流结算时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="物流订单支付渠道" prop="logisticsPayChannel">
          <el-input v-model="form.logisticsPayChannel" placeholder="请输入物流订单支付渠道"/>
        </el-form-item>
        <el-form-item label="物流订单支付单号" prop="outTradeNo">
          <el-input v-model="form.outTradeNo" placeholder="请输入物流订单支付单号"/>
        </el-form-item>
        <el-form-item label="物流公司对账状态">
          <el-radio-group v-model="form.reconciliationStatus">
            <el-radio
              v-for="dict in dict.type.reconciliation_status"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{ dict.label }}
            </el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="物流公司对账日期" prop="reconciliationTime">
          <el-date-picker clearable
                          v-model="form.reconciliationTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择物流公司对账日期">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<style>
.logistics-detail-expand {
  font-size: 0;
}

.logistics-detail-expand label {
  width: 100px;
  color: #99a9bf;
}

.logistics-detail-expand .el-form-item {
  margin-left: 200px;
  margin-right: 0;
  margin-bottom: 0;
  width: 30%;
}
</style>
<script>
import {listLogistics, getLogistics, delLogistics, addLogistics, updateLogistics} from "@/api/system/logistics";

export default {
  name: "Logistics",
  dicts: ['reconciliation_status', 'order_logistics_status', 'logistics_type', 'logistics_settlement_status', 'sys_pay_channel'],
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
      // 订单物流表格数据
      logisticsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 物流公司对账日期时间范围
      daterangeLogisticsCreateTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        orderNo: null,
        expressNo: null,
        consigneeRealname: null,
        consigneeTelphone: null,
        logisticsType: null,
        logisticsId: null,
        orderlogisticsStatus: null,
        logisticsSettlementStatus: null,
        logisticsCreateTime: null,
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
    /** 查询订单物流列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeLogisticsCreateTime && '' != this.daterangeLogisticsCreateTime) {
        this.queryParams.params["beginLogisticsCreateTime"] = this.daterangeLogisticsCreateTime[0];
        this.queryParams.params["endLogisticsCreateTime"] = this.daterangeLogisticsCreateTime[1];
      }
      listLogistics(this.queryParams).then(response => {
        this.logisticsList = response.rows;
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
        orderlogisticsId: null,
        orderId: null,
        expressNo: null,
        consigneeRealname: null,
        consigneeTelphone: null,
        consigneeTelphone2: null,
        consigneeAddress: null,
        consigneZip: null,
        logisticsType: null,
        logisticsId: null,
        logisticsFee: null,
        deliveryAmount: null,
        orderlogisticsStatus: 0,
        logisticsSettlementStatus: 0,
        logisticsResult: null,
        logisticsCreateTime: null,
        logisticsUpdateTime: null,
        logisticsSettlementTime: null,
        logisticsPayChannel: null,
        outTradeNo: null,
        reconciliationStatus: 0,
        reconciliationTime: null,
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
      this.daterangeLogisticsCreateTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.orderlogisticsId)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单物流";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const orderlogisticsId = row.orderlogisticsId || this.ids
      getLogistics(orderlogisticsId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单物流";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.orderlogisticsId != null) {
            updateLogistics(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addLogistics(this.form).then(response => {
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
      const orderlogisticsIds = row.orderlogisticsId || this.ids;
      this.$modal.confirm('是否确认删除订单物流编号为"' + orderlogisticsIds + '"的数据项？').then(function () {
        return delLogistics(orderlogisticsIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/logistics/export', {
        ...this.queryParams
      }, `logistics_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
