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
          v-hasPermi="['system:orderdetail:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['system:orderdetail:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:orderdetail:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:orderdetail:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="orderdetailList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
<!--      <el-table-column label="订单商品详情编号" align="center" prop="orderDetailId" />-->
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
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:orderdetail:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:orderdetail:remove']"
          >删除</el-button>
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

    <!-- 添加或修改订单商品详情对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单编号" prop="orderId">
          <el-input v-model="form.orderId" placeholder="请输入订单编号" />
        </el-form-item>
        <el-form-item label="商品编号" prop="productId">
          <el-input v-model="form.productId" placeholder="请输入商品编号" />
        </el-form-item>
        <el-form-item label="商品名称" prop="productName">
          <el-input v-model="form.productName" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="商品价格" prop="productPrice">
          <el-input v-model="form.productPrice" placeholder="请输入商品价格" />
        </el-form-item>
        <el-form-item label="商品型号" prop="productMarque">
          <el-input v-model="form.productMarque" placeholder="请输入商品型号" />
        </el-form-item>
        <el-form-item label="商品仓库条码" prop="productStoreBarcode">
          <el-input v-model="form.productStoreBarcode" placeholder="请输入商品仓库条码" />
        </el-form-item>
        <el-form-item label="折扣比例" prop="discountRate">
          <el-input v-model="form.discountRate" placeholder="请输入折扣比例" />
        </el-form-item>
        <el-form-item label="折扣金额" prop="discountAmount">
          <el-input v-model="form.discountAmount" placeholder="请输入折扣金额" />
        </el-form-item>
        <el-form-item label="购买数量" prop="number">
          <el-input v-model="form.number" placeholder="请输入购买数量" />
        </el-form-item>
        <el-form-item label="总金额" prop="subtotal">
          <el-input v-model="form.subtotal" placeholder="请输入总金额" />
        </el-form-item>
        <el-form-item label="商品状态" prop="isProductExists">
          <el-select v-model="form.isProductExists" placeholder="请选择商品状态">
            <el-option
              v-for="dict in dict.type.is_product_exists"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="客户备注" prop="remark">
          <el-input v-model="form.remark" placeholder="请输入客户备注" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOrderdetail, getOrderdetail, delOrderdetail, addOrderdetail, updateOrderdetail } from "@/api/system/orderdetail";

export default {
  name: "Orderdetail",
  dicts:['is_product_exists'],
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
      // 订单商品详情表格数据
      orderdetailList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderId: null,
        orderNo: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询订单商品详情列表 */
    getList() {
      this.loading = true;
      listOrderdetail(this.queryParams).then(response => {
        this.orderdetailList = response.rows;
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
        orderDetailId: null,
        orderId: null,
        productId: null,
        productName: null,
        productPrice: null,
        productMarque: null,
        productStoreBarcode: null,
        productModeDesc: null,
        productModeParams: null,
        discountRate: null,
        discountAmount: null,
        number: null,
        subtotal: null,
        isProductExists: null,
        remark: null,
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
      this.ids = selection.map(item => item.orderDetailId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单商品详情";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const orderDetailId = row.orderDetailId || this.ids
      getOrderdetail(orderDetailId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单商品详情";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.orderDetailId != null) {
            updateOrderdetail(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrderdetail(this.form).then(response => {
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
      const orderDetailIds = row.orderDetailId || this.ids;
      this.$modal.confirm('是否确认删除订单商品详情编号为"' + orderDetailIds + '"的数据项？').then(function() {
        return delOrderdetail(orderDetailIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/orderdetail/export', {
        ...this.queryParams
      }, `orderdetail_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
