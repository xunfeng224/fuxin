<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <blockquote class="text-warning" style="font-size: 14px">
          <h4 class="text-success">
            失败铺垫出来成功之路！
          </h4>
          <br />
          <h4 class="text-info">
            凝聚我们的力量，收获明日的辉煌！
          </h4>
          <br />
          <h4 class="text-warning">
            人人爱岗敬业，公司兴旺发达！
          </h4>
          <br />
          <h4 class="text-muted">
            细节决定成功，点滴铸就辉煌！
          </h4>
          <br />
          <h4 class="text-primary">
            少年辛苦终身事，莫向光阴隋寸功！
          </h4>
          <br />
          <h4 class="text-danger">
            忠诚合作，积极乐观，努力开拓，勇往直前！
          </h4>
        </blockquote>

        <hr />
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :sm="24" :lg="12" style="padding-left: 20px">
        <h2>福鑫家电有限公司</h2>
        <p>
          福鑫家电有限公司是一家集开发、设计、制造、营销于一体的现代化新型企业，主要生产福鑫牌冰箱、洗衣机、空调、洗碗机、电热水壶、豆浆机、榨汁机、煮蛋器、电火锅等小家电类产品。公司拥有雄厚的技术力量，先进的设备、完善的生产管理、优良的售后服务，是家用小电器专业制造商和知名品牌。出众的创新构思、优秀的产品设计、坚持最严格的质量标准，“福鑫家电”誉享全球。
        </p>

<!--        <p>-->
<!--          <el-tag type="danger">&yen;免费开源</el-tag>-->
<!--        </p>-->
<!--        <p>-->
<!--          <el-button-->
<!--            type="primary"-->
<!--            size="mini"-->
<!--            icon="el-icon-cloudy"-->
<!--            plain-->
<!--            @click="goTarget('https://gitee.com/y_project/RuoYi-Cloud')"-->
<!--            >访问码云</el-button-->
<!--          >-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            icon="el-icon-s-home"-->
<!--            plain-->
<!--            @click="goTarget('http://ruoyi.vip')"-->
<!--            >访问主页</el-button-->
<!--          >-->
<!--        </p>-->
      </el-col>

      <el-col :sm="24" :lg="12" style="padding-left: 50px">
        <el-row>
          <el-col :span="12">
            <h2>福鑫家电信息管理系统</h2>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="6">
            <h4>后端技术</h4>
            <ul>
              <li>SpringBoot</li>
              <li>SpringCloud</li>
              <li>Nacos</li>
              <li>Sentinel</li>
              <li>Seata</li>
              <li>Minio</li>
              <li>...</li>
            </ul>
          </el-col>
          <el-col :span="6">
            <h4>前端技术</h4>
            <ul>
              <li>Vue</li>
              <li>Vuex</li>
              <li>Element-ui</li>
              <li>Axios</li>
              <li>Echarts</li>
              <li>Quill</li>
              <li>...</li>
            </ul>
          </el-col>
        </el-row>
        <p>
          <b>当前版本:</b> <span>v{{ version }}</span>
        </p>
      </el-col>
    </el-row>
    <el-divider />
  </div>
</template>

<script>
export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "1.1.0",
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
  },
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}
</style>

