<template>
<div>
  <div class="m-b-20 ovf-hd">
    <div class="fl">
      数据表列表
    </div>

  </div>
  <el-table :data="tableData" style="width: 100%" @selection-change="selectItem">
    <el-table-column type="selection" width="50">
    </el-table-column>
    <el-table-column prop="Name" label="数据表名" width="200">
    </el-table-column>
    <el-table-column label="记录数" prop="Rows" width="200">
    </el-table-column>
    <el-table-column label="引擎类型" prop="Engine" width="200">
    </el-table-column>
    <el-table-column label="字符集" prop="Collation" width="200">
    </el-table-column>
    <el-table-column label="备注" prop="Comment" width="200">
    </el-table-column>
  </el-table>
  <div class="pos-rel p-t-20">

    <div class="fl" v-show="addShow">
      <!-- <el-button slot="append" > -->
      <i class="btn-link-large add-btn">
        <a :href='this.downloadurl' :download='this.downloadurl' >导出数据库</a>
        <!-- <router-link target="_blank"></router-link> -->
      </i>&nbsp;&nbsp;
      <!-- </el-button> -->
    </div>
    <div class="block pages">
      <el-pagination @current-change="handleCurrentChange" layout="prev, pager, next" :page-size="limit" :current-page="currentPage" :total="dataCount">
      </el-pagination>
    </div>
  </div>
</div>
</template>

<script>
import btnGroup from '../../../Common/btn-group.vue'
import http from '../../../../assets/js/http'

export default {
  data() {
    return {
      tableData: [],
      dataCount: null,
      currentPage: null,
      keywords: '',
      multipleSelection: [],
      limit: 1,
      downloadurl: null,
    }
  },
  methods: {
    download() {
      this.apiGet('admin/mysqls/download').then((res) => {
        this.downloadurl = res.data;
        console.log(res.data);
      })
    },
    selectItem(val) {
      this.multipleSelection = val
    },
    handleCurrentChange(page) {
      router.push({
        path: this.$route.path,
        query: {
          keywords: this.keywords,
          page: page
        }
      })
    },

    getAllmysqls() {
      this.loading = false
      const data = {
        params: {
          keywords: this.keywords,
          page: this.currentPage,
          limit: this.limit
        }
      }
      this.apiGet('admin/mysqls').then((res) => {
        this.tableData = res.data;
        // console.log(res.data)
        // var str = JSON.stringify(res);
        // console.log(JSON.parse(res));
      })
    },
    getCurrentPage() {
      let data = this.$route.query
      if (data) {
        if (data.page) {
          this.currentPage = parseInt(data.page)
        } else {
          this.currentPage = 1
        }
      }
    },
    getKeywords() {
      let data = this.$route.query
      if (data) {
        if (data.keywords) {
          this.keywords = data.keywords
        } else {
          this.keywords = ''
        }
      }
    },
    init() {
      this.getKeywords()
      this.getCurrentPage()
      this.getAllmysqls()
    }
  },
  created() {
    this.init()
    this.download()
  },
  computed: {
    addShow() {
      return _g.getHasRule('mysqls-download')
    }

  },
  watch: {
    '$route' (to, from) {
      this.init()
    }
  },
  components: {
    btnGroup
  },
  mixins: [http]
}
</script>
