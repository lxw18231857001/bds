<template>
	<div>
		<div class="m-b-20">
预约测量列表
			<!-- <router-link class="btn-link-large add-btn" to="add">

			</router-link> -->
		</div>
		<el-table
		:data="tableData"
		style="width: 100%"
		@selection-change="selectItem">
			<el-table-column
			type="selection"
			width="50">
			</el-table-column>
			<el-table-column
			label="ID"
			prop="id" width="80" >
			</el-table-column>
			<el-table-column
			label="姓名"
			prop="name" >
			</el-table-column>
      <el-table-column
      label="预约电话"
      prop="tel">
      </el-table-column>
			<el-table-column
      label="预约地址"
      prop="address" width="350">
      </el-table-column>
			<el-table-column
      label="预约时间"
      prop="ordertime">
      </el-table-column>
			<!-- <el-table-column
			label="状态"
      prop="status"
			width="100">
        <template scope="scope">
          <div>
            {{ scope.row.status | status }}
          </div>
        </template>
			</el-table-column> -->
			<el-table-column
			label="操作"
			width="200">
        <template scope="scope">
  				<div>
  					<!-- <span>
  						<router-link :to="{ name: 'measureEdit', params: { id: scope.row.id }}" class="btn-link edit-btn">
  						编辑
  						</router-link>
  					</span> -->
  					<span>
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
			<btnGroup :selectedData="multipleSelection" :type="'measure'"></btnGroup>
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
        multipleSelection: []
      }
    },
    methods: {
      selectItem(val) {
        this.multipleSelection = val
      },
      confirmDelete(item) {
        this.$confirm('确认删除该预约信息?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          _g.openGlobalLoading()
          this.apiDelete('admin/measure/', item.id).then((res) => {
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
      getMeasure() {
        this.apiGet('admin/measure').then((res) => {
          this.handelResponse(res, (data) => {
            this.tableData = data
          })
        })
      }
    },
    created() {
      this.getMeasure()
    },
    computed: {
      addShow() {
        return _g.getHasRule('measure-save')
      },
      editShow() {
        return _g.getHasRule('measure-update')
      },
      deleteShow() {
        return _g.getHasRule('measure-delete')
      }
    },
    components: {
      btnGroup
    },
    mixins: [http]
  }
</script>
