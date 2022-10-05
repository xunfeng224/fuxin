<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="公司名称" prop="deptName">
        <el-input
          v-model="queryParams.deptName"
          placeholder="请输入客户所属公司名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户账号" prop="cusName">
        <el-input
          v-model="queryParams.cusName"
          placeholder="请输入客户账号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="客户昵称" prop="nickName">
        <el-input
          v-model="queryParams.nickName"
          placeholder="请输入客户昵称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号码" prop="phonenumber">
        <el-input
          v-model="queryParams.phonenumber"
          placeholder="请输入手机号码"
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
          v-hasPermi="['system:customer:add']"
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
          v-hasPermi="['system:customer:edit']"
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
          v-hasPermi="['system:customer:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:customer:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="customerList" @selection-change="handleSelectionChange" ref="table">
      <el-table-column type="selection" width="55" align="center" />
      <!--展开详情-->
      <el-table-column type="expand">
        <template slot-scope="props">
          <el-form label-position="center" inline class="customer-detail-expand">
            <el-form-item label="客户编号">
              <span>{{ props.row.cusId }}</span>
            </el-form-item>
            <el-form-item label="最后登录IP">
              <span>{{ props.row.loginIp }}</span>
            </el-form-item>
            <el-form-item label="最后登录时间">
              <span>{{ props.row.loginDate }}</span>
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


      <el-table-column label="客户账号" align="center" prop="cusName" />
      <el-table-column label="客户昵称" align="center" prop="nickName" />
      <el-table-column label="所属公司" align="center" prop="deptName" />
      <el-table-column label="客户类型" align="center" prop="cusType" />
      <el-table-column label="客户邮箱" align="center" prop="email" />
      <el-table-column label="手机号码" align="center" prop="phonenumber" />
      <el-table-column label="客户性别" align="center" prop="sex">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_user_sex" :value="scope.row.sex"/>
        </template>
      </el-table-column>
      <el-table-column label="帐号状态" align="center" prop="status" >
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.status"
            active-value="0"
            inactive-value="1"
            @change="handleStatusChange(scope.row)"
          ></el-switch>
        </template>
      </el-table-column>



      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleQueryOrder(scope.row)"
            v-hasPermi="['system:customer:queryOrder']"
          >查看订单</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:customer:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:customer:remove']"
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

    <!-- 添加或修改客户信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="部门ID" prop="deptId">
          <el-input v-model="form.deptId" placeholder="请输入部门ID" />
        </el-form-item>
        <el-form-item label="客户账号" prop="cusName">
          <el-input v-model="form.cusName" placeholder="请输入客户账号" />
        </el-form-item>
        <el-form-item label="客户昵称" prop="nickName">
          <el-input v-model="form.nickName" placeholder="请输入客户昵称" />
        </el-form-item>

        <el-form-item  label="客户密码" prop="password">
          <el-input v-model="form.password" placeholder="请输入客户密码" type="password" maxlength="20" show-password/>
        </el-form-item>

        <el-form-item label="客户邮箱" prop="email">
          <el-input v-model="form.email" placeholder="请输入客户邮箱" />
        </el-form-item>
        <el-form-item label="手机号码" prop="phonenumber">
          <el-input v-model="form.phonenumber" placeholder="请输入手机号码" />
        </el-form-item>
        <el-form-item label="客户性别" prop="sex">
          <el-select v-model="form.sex" placeholder="请选择客户性别">
            <el-option
              v-for="dict in dict.type.sys_user_sex"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


    <!-- 客户查看订单框 -->
    <el-dialog :title="title" :visible.sync="dialogTableVisible" center >
      <el-table :data="customerOrderList">
        <el-table-column property="orderNo" label="订单编号" ></el-table-column>
        <el-table-column label="订单状态" align="center" prop="orderStatus">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.sys_order_status" :value="scope.row.orderStatus"/>
          </template>
        </el-table-column>
        <el-table-column property="productAmountTotal" label="订单总价"></el-table-column>
        <el-table-column property="orderAmountTotal" label="订单金额"></el-table-column>
        <el-table-column property="addressId" label="收货地址编号"></el-table-column>
        <el-table-column property="orderlogisticsId" label="订单物流编号"></el-table-column>
        <el-table-column property="createTime" label="创建时间"></el-table-column>
        <el-table-column property="payTime" label="支付时间"></el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogTableVisible = false">取 消</el-button>
        <el-button type="primary" @click="dialogTableVisible = false">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<style>
.customer-detail-expand {
  font-size: 0;
}
.customer-detail-expand label {
  width: 100px;
  color: #99a9bf;
}
.customer-detail-expand .el-form-item {
  margin-left: 200px;
  margin-right: 0;
  margin-bottom: 0;
  width: 30%;
}
</style>
<script>
import { listCustomer, getCustomer, delCustomer, addCustomer, updateCustomer, changeCusStatus, getCustomerOrder } from "@/api/system/customer";


export default {
  name: "Customer",
  dicts: ['sys_user_sex','sys_order_status'],
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
      // 客户信息表格数据
      customerList: [],
      // 客户订单信息表格数据
      customerOrderList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      dialogTableVisible: false,
      // 备注时间范围
      daterangeCreateTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        deptId: null,
        deptName: null,
        cusName: null,
        nickName: null,
        cusType: null,
        email: null,
        phonenumber: null,
        status: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        cusName: [
          { required: true, message: "客户账号不能为空", trigger: "blur" }
        ],
        nickName: [
          { required: true, message: "客户昵称不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询客户信息列表 */
    getList() {
      this.loading = true;
      this.queryParams.params = {};
      if (null != this.daterangeCreateTime && '' != this.daterangeCreateTime) {
        this.queryParams.params["beginCreateTime"] = this.daterangeCreateTime[0];
        this.queryParams.params["endCreateTime"] = this.daterangeCreateTime[1];
      }
      console.log(this.queryParams);
      listCustomer(this.queryParams).then(response => {

        this.customerList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 用户状态修改
    handleStatusChange(row) {
      let text = row.status === "0" ? "启用" : "停用";
      this.$modal.confirm('确认要"' + text + '""' + row.cusName + '"客户吗？').then(function() {
        return changeCusStatus(row.cusId, row.status);
      }).then(() => {
        this.$modal.msgSuccess(text + "成功");
      }).catch(function() {
        row.status = row.status === "0" ? "1" : "0";
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
        cusId: null,
        deptId: null,
        deptName: null,
        cusName: null,
        nickName: null,
        cusType: null,
        email: null,
        phonenumber: null,
        sex: null,
        avatar: null,
        password: null,
        status: "0",
        delFlag: null,
        loginIp: null,
        loginDate: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
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
      this.daterangeCreateTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.cusId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加客户信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const cusId = row.cusId || this.ids
      getCustomer(cusId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改客户信息";
      });
    },
    // //点击按钮展开行
    // handleToogleExpand(row) {
    //   let $table = this.$refs.table;
    //   console.log($table);
    //   // this.row.data.map((item) => {
    //   //   if (row.id != item.id) {
    //   //     $table.toggleRowExpansion(item, false);
    //   //   }
    //   // })
    //   $table.toggleRowExpansion(row);
    // },

    /** 客户查看订单按钮操作 */
    handleQueryOrder(row) {
      this.reset();
      const cusId = row.cusId || this.ids
      getCustomerOrder(cusId).then(response => {
        this.customerOrderList = response.data;
        if (this.customerOrderList.length == 0) {
          this.$message('未查询到该客户相关的订单');
        } else{
          this.dialogTableVisible = true;
          this.title = "客户订单查看";
        }
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.cusId != null) {
            updateCustomer(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCustomer(this.form).then(response => {
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
      const cusIds = row.cusId || this.ids;
      this.$modal.confirm('是否确认删除客户信息编号为"' + cusIds + '"的数据项？').then(function() {
        return delCustomer(cusIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/customer/export', {
        ...this.queryParams
      }, `customer_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
