<template>
<div class="m-l-50 m-t-30 w-900">
  <div class=" top-active">修改服务信息</div>
  <el-form ref="form" :model="form" :rules="rules" label-width="130px">
    <el-form-item label="主标题" prop="main_title">
      <el-input v-model.trim="form.main_title" class="h-40 w-500"></el-input>
    </el-form-item>
    <!-- <el-form-item label="副标题" prop="vice_title">
      <el-input v-model.trim="form.vice_title" class="h-40 w-500"></el-input>
    </el-form-item> -->
    <el-form-item label="图片" prop="photo">
      <el-upload :action="uploadUrl" type="drag" :thumbnail-mode="true" :on-preview="viewPic" :on-remove="handleRemove" :on-success="uploadSuccess" :on-error="uploadFail" :default-file-list="fileList">
        <div class="bgimg">
          <img :src="form.photo" alt="图片">
        </div>
        <div class="el-dragger__text"><em>点击上传&nbsp;&nbsp;&nbsp;(只能上传jpg/png文件)</em></div>
      </el-upload>
    </el-form-item>
    <el-form-item label="图标" prop="icon">
      <el-upload :action="uploadUrl" type="drag" :thumbnail-mode="true" :on-preview="viewPic" :on-remove="handleRemove" :on-success="uploadSuccess2" :on-error="uploadFail" :default-file-list="fileList2">
        <div class="bgimg">
          <img :src="form.icon" alt="图片">
        </div>
        <div class="el-dragger__text"><em>点击上传&nbsp;&nbsp;&nbsp;(只能上传jpg/png文件)</em></div>
      </el-upload>
    </el-form-item>
    <el-form-item label="修改日期">
      <el-col :span="11">
        <el-form-item prop="create_time">
          <el-date-picker type="datetime" placeholder="修改日期" size="small" v-model="form.create_time" style="width: 60%;">
          </el-date-picker>
        </el-form-item>
      </el-col>
    </el-form-item>
    <el-form-item label="所属部分" prop="group">
      <el-select v-model="form.group" placeholder="所属部分" class="w-200">
        <el-option v-for="item in options" :label="item.title" :value="item.id"></el-option>
      </el-select>
    </el-form-item>
    <el-form-item label="排序" prop="order">
      <el-input v-model.number="form.order" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="内容" prop="content">
      <div class="editor-container">
        <UE :defaultMsg=form.content :config=config ref="ue"></UE>
      </div>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="getUEContent();edit('form')" :loading="isLoading">提交</el-button>
      <el-button @click="goback()">返回</el-button>
    </el-form-item>
  </el-form>
</div>
</template>

<script>
import http from '../../../../assets/js/http'
import fomrMixin from '../../../../assets/js/form_com'
import UE from '../../../Common/ue.vue'

export default {
  components: {
    UE
  },
  data() {
    return {
      isLoading: false,
      fileList: [],
      form: {
        id: null,
        main_title: '',
        vice_title: '',
        photo: '',
        icon: '',
        create_time: '',
        order: '',
        content: ''
      },
      uploadUrl: '',
      options: [],
      rules: {
        group: [{
          required: true,
          message: '请选择所属部分',
        }],
        order: [{
          required: true,
          message: '请输入排序'
        }, {
          type: 'number',
          message: '请输入数字',
          trigger: 'blur'
        }],

      },
      config: {
        initialFrameWidth: null,
        initialFrameHeight: 350
      }
    }
  },
  methods: {
    edit(form) {
      this.$refs[form].validate((valid) => {
        if (valid) {
          this.isLoading = !this.isLoading
          this.apiPut('admin/service/', this.form.id, this.form).then((res) => {
            this.handelResponse(res, (data) => {
              _g.toastMsg('success', '编辑成功')
              setTimeout(() => {
                this.goback()
              }, 1500)
            }, () => {
              this.isLoading = !this.isLoading
            })
          })
        }
      })
    },
    getServiceGroup() {
      this.apiGet('admin/serviceGroup').then((res) => {
        console.log(res)
        this.handelResponse(res, (data) => {
          this.options = this.options.concat(data)
        })
      })
    },
    getSerInfo() {
      this.form.id = this.$route.params.id
      this.apiGet('admin/service/' + this.form.id).then((res) => {
        this.handelResponse(res, (data) => {
          this.form.main_title = data.main_title
          this.form.vice_title = data.vice_title
          this.form.photo = data.photo
          this.form.icon = data.icon
          this.form.content = data.content
          this.form.create_time = data.create_time
          this.form.order = data.order
          this.form.group = data.group

        })
      })
    },
    getUEContent() {
      let content = this.$refs.ue.getUEContent();
      this.form.content = content
    },
    uploadSuccess(res, file, fileList) {
      this.form.photo = res.data
      let data = {
        name: '图片',
        url: file.url
      }
      if (this.fileList.length) {
        this.fileList[0] = data
      } else {
        this.fileList.push(data)
      }
    },
    uploadSuccess2(res, file2, fileList2) {
      this.form.icon = res.data
      let data = {
        name: '图片',
        url: file.url
      }
      if (this.fileList2.length) {
        this.fileList2[0] = data
      } else {
        this.fileList2.push(data)
      }
    },
    uploadFail(err, res, file) {
      console.log('err = ', _g.j2s(err))
      console.log('res = ', _g.j2s(res))
    },
    handleRemove(file, fileList) {
      console.log('file = ', file)
      console.log('fileList = ', fileList)
    },

  },

  created() {
    this.getSerInfo()
    this.getServiceGroup()
    this.uploadUrl = window.HOST + 'admin/upload'
    _g.closeGlobalLoading()
  },

  mixins: [http, fomrMixin]
}
</script>
