<template>
<div>
  <div class="m-b-20">
    <router-link class="btn-link-large add-btn" to="add">
      <i class="el-icon-plus"></i>&nbsp;&nbsp;添加联系我们
    </router-link>
  </div>
  <el-table :data="tableData" style="width: 100%" @selection-change="selectItem">
    <el-table-column type="selection" width="50">
    </el-table-column>
    <el-table-column label="ID" prop="id" width="50">
    </el-table-column>
    <el-table-column label="标题" prop="title" width="70">
    </el-table-column>
    <el-table-column label="地址" prop="address" width="250">
    </el-table-column>
    <el-table-column label="邮编" prop="posts" >
    </el-table-column>
    <el-table-column label="电话/传真" prop="tel" >
    </el-table-column>
    <el-table-column label="全国统一服务热线" prop="hotline" >
    </el-table-column>
    <el-table-column label="邮箱" prop="email">
    </el-table-column>

    <!-- <el-table-column label="背景图" prop="backimage" width="80">
			<template scope="scope">
          <div class="bgimg" v-show='scope.row.backimage'>
              <img :src='scope.row.backimage'>
          </div>
          <div class="bgimg" v-show='scope.row.backimage == false'>
              <span>暂无图片</span>
          </div>
        </template>
    </el-table-column>
    <el-table-column label="排序" prop="order" width="80">
      <template scope="scope">
          <div>
            {{ scope.row.order }}
          </div>
        </template>
    </el-table-column>-->

    <el-table-column label="添加时间" prop="create_time" width="110">
    </el-table-column>


    <el-table-column label="操作" width="180">
      <template scope="scope">
  				<div>
  					<span>
  						<router-link :to="{ name: 'contactEdit', params: { id: scope.row.id }}" class="btn-link edit-btn">
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
    <btnGroup :selectedData="multipleSelection" :type="'contact'"></btnGroup>
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
      multipleSelection: [],
    }
  },
  methods: {
    selectItem(val) {
      this.multipleSelection = val
    },
    confirmDelete(item) {
      this.$confirm('确认删除该联系我们?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        _g.openGlobalLoading()
        this.apiDelete('admin/contact/', item.id).then((res) => {
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
    getCase() {
      this.apiGet('admin/contact').then((res) => {
        this.handelResponse(res, (data) => {
          this.tableData = data
        })
      })
    }
  },
  created() {
    this.getCase()
  },
  computed: {
    addShow() {
      return _g.getHasRule('contact-save')
    },
    editShow() {
      return _g.getHasRule('contact-update')
    },
    deleteShow() {
      return _g.getHasRule('contact-delete')
    }
  },
  components: {
    btnGroup
  },
  mixins: [http]
}
</script>
