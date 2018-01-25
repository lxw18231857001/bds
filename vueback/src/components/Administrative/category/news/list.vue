<template>
<div>
  <div class="m-b-20">
    <div class="fl" v-show="addShow">
      <router-link class="btn-link-large add-btn" to="add">
        <i class="el-icon-plus"></i>&nbsp;&nbsp;添加新闻
      </router-link>
    </div>
    <div class="fl w-200 m-l-30">
      <el-input placeholder="请输入关键字" v-model="keywords">
        <el-button slot="append" icon="search" @click="search()"></el-button>
      </el-input>
    </div>
  </div>

  <el-table :data="tableData" style="width: 100%" @selection-change="selectItem">
    <el-table-column type="selection" width="50">
    </el-table-column>
    <el-table-column label="ID" prop="id" width="100">
    </el-table-column>
    <el-table-column label="新闻标题" prop="title">
    </el-table-column>
    <el-table-column label="新闻列表图" prop="listpic">
      <template scope="scope">
          <div class="bgimg" v-show='scope.row.listpic'>
              <img :src='scope.row.listpic'>
          </div>
          <div class="bgimg" v-show='scope.row.listpic == false'>
              <span>暂无图片</span>
          </div>
        </template>
    </el-table-column>
    <el-table-column label="新闻分类" prop="am_title">
    </el-table-column>
    <el-table-column label="添加时间" prop="create_time" width="150">
    </el-table-column>
    <el-table-column label="排序" prop="order" width="100">
      <template scope="scope">
          <div>
            {{ scope.row.order }}
          </div>
        </template>
    </el-table-column>

    <el-table-column label="操作" width="200">
      <template scope="scope">
  				<div>
  					<span>
  						<router-link :to="{ name: 'newsEdit', params: { id: scope.row.id }}" class="btn-link edit-btn">
  						编辑
  						</router-link>
  					</span>
  					<span>
  						<el-button
  						<el-button
  						size="small"
  						type="danger"
  						@click="confirmDelete(scope.row)">
  						删除
  						</el-button>
  					</span>
  				</div>
        </template>
    </el-table-column>
  </el-table>
  <div class="pos-rel p-t-20">
    <btnGroup :selectedData="multipleSelection" :type="'news'"></btnGroup>
    <div class="block pages">
      <el-pagination @current-change="handleCurrentChange" layout="prev, pager, next" :page-size="limit" :current-page="currentPage" :total="dataCount">
      </el-pagination>
    </div>
  </div>
</div>
</template>
<style>
.cell .bgimg img {
  width: 50px;
  height: 27px;
  padding-top: 5px;
}
</style>
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
      limit: 10
    }
  },
  methods: {
    search() {
      router.push({
        path: this.$route.path,
        query: {
          keywords: this.keywords,
          page: 1
        }
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

    confirmDelete(item) {
      this.$confirm('确认删除该新闻?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        _g.openGlobalLoading()
        this.apiDelete('admin/news/', item.id).then((res) => {
          _g.closeGlobalLoading()
          this.handelResponse(res, (data) => {
            _g.toastMsg('success', '删除成功')
            setTimeout(() => {
              _g.shallowRefresh(this.$route.name)
            }, 1500)
          })
        })
      }).catch(() => {
        // handle error
      })
    },

    getnews() {
      this.loading = false
      const data = {
        params: {
          keywords: this.keywords,
          page: this.currentPage,
          limit: this.limit
        }
      }
      this.apiGet('admin/news',data).then((res) => {
        this.handelResponse(res, (data) => {
          this.tableData = data.list
          console.log(res);
          this.dataCount = data.dataCount
        })
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
      this.getnews()
    }
  },
  created() {
    this.init()
  },
  computed: {
    addShow() {
      return _g.getHasRule('news-save')
    },
    editShow() {
      return _g.getHasRule('news-update')
    },
    deleteShow() {
      return _g.getHasRule('news-delete')
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
