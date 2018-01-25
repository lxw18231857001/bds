<template>
<div class="m-l-50 m-t-30 w-900">
  <div class=" top-active">添加公司信息</div>
  <el-form ref="form" :model="form" :rules="rules" label-width="130px">
    <el-form-item label="公司信息标题" prop="title">
      <el-input v-model.trim="form.title" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="地址" prop="address">
      <el-input v-model.trim="form.address" class="h-40 w-500"></el-input>
    </el-form-item>
    <el-form-item label="电话" prop="tel">
      <el-input v-model.trim="form.tel" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="24小时专线" prop="hotline">
      <el-input v-model.trim="form.hotline" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="邮箱" prop="email">
      <el-input v-model.email="form.email" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="招聘邮箱" prop="hremail">
      <el-input v-model.email="form.hremail" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="背景图" prop="backimage">
      <el-upload :action="uploadUrl" type="drag" :thumbnail-mode="true" :on-preview="viewPic" :on-remove="handleRemove" :on-success="uploadSuccess" :on-error="uploadFail" :default-file-list="fileList">
        <i class="el-icon-upload"></i>
        <div class="el-dragger__text"><em>点击上传&nbsp;&nbsp;&nbsp;(只能上传jpg/png文件)</em></div>
      </el-upload>
    </el-form-item>
    <el-form-item label="添加日期">
      <el-col :span="11">
        <el-form-item prop="create_time">
          <el-date-picker type="datetime" placeholder="添加日期" size="small" v-model="form.create_time" style="width: 60%;">
          </el-date-picker>
        </el-form-item>
      </el-col>
    </el-form-item>
    <el-form-item label="排序" prop="order">
      <el-input v-model.number="form.order" class="h-40 w-200"></el-input>
    </el-form-item>
    <el-form-item label="类型" prop="type">
      <el-radio-group v-model="form.type">
        <el-radio label="1">公司总/分部</el-radio>
        <el-radio label="2">其他</el-radio>
      </el-radio-group>
    </el-form-item>
    <el-form-item label="公司信息" prop="content">
      <div class="editor-container">
        <UE :config=config ref="ue"></UE>
      </div>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="getUEContent();add('form')" :loading="isLoading">提交</el-button>
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
        title: '',
        address: '',
        tel: '',
        hotline: '',
        email: '',
        hremail: '',
        backimage: '',
        create_time: '',
        order: '',
        type: '1',
        content: ''
      },
      uploadUrl: '',
      rules: {
        title: [{
          required: true,
          message: '请输入公司信息标题',
          trigger: 'blur'
        }],
        email: [{
          type:'email',
          message: '邮箱格式不正确',
          trigger: 'blur'
        }],
        hremail: [{
          type:'email',
          message: '招聘邮箱格式不正确',
          trigger: 'blur'
        }],
        create_time: [{
          type: 'date',
          required: true,
          message: '请选择添加日期',
          trigger: 'change'
        }],
        order: [{
          required: true,
          message: '请输入排序'
        }, {
          type: 'number',
          message: '请输入数字',
          trigger: 'blur'
        }],
        content: [{
          required: true,
          message: '请输入内容',
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
    add(form) {
      this.$refs[form].validate((valid) => {
        if (valid) {
          this.isLoading = !this.isLoading
          this.apiPost('admin/contact', this.form).then((res) => {
            this.handelResponse(res, (data) => {
              console.log(res)
              console.log(data)
              _g.toastMsg('success', '添加成功')
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
    getUEContent() {
      let content = this.$refs.ue.getUEContent();
      this.form.content = content
    },

    uploadSuccess(res, file, fileList) {
      this.form.backimage = res.data
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
    this.uploadUrl = window.HOST + 'admin/upload'
    _g.closeGlobalLoading()
  },

  mixins: [http, fomrMixin]
}
</script>
