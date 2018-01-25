<template>
<div class="m-l-50 m-t-30 w-900">
  <div class=" top-active" >添加加盟</div>
  <el-form ref="form" :model="form" :rules="rules" label-width="130px">
    <el-form-item label="加盟名称" prop="title">
      <el-input v-model.trim="form.title" class="h-40 w-500"></el-input>
    </el-form-item>
    <el-form-item label="图片" prop="pic">
      <el-upload :action="uploadUrl" type="drag" :thumbnail-mode="true" :on-preview="viewPic" :on-remove="handleRemove" :on-success="uploadSuccess" :on-error="uploadFail" :default-file-list="fileList">
        <i class="el-icon-upload"></i>
        <div class="el-dragger__text"><em>点击上传&nbsp;&nbsp;(只能上传jpg/png文件)</em></div>
      </el-upload>
    </el-form-item>
    <el-form-item label="主体图" prop="img">
      <el-upload :action="uploadUrl" type="drag" :thumbnail-mode="true" :on-preview="viewPic" :on-remove="handleRemove" :on-success="uploadSuccess2" :on-error="uploadFail" :default-file-list="fileList2">
        <i class="el-icon-upload"></i>
        <div class="el-dragger__text"><em>点击上传&nbsp;&nbsp;(只能上传jpg/png文件)</em></div>
      </el-upload>
    </el-form-item>
    <el-form-item label="加盟分类" prop="pid">
      <el-select v-model="form.pid" placeholder="加盟分类" class="w-200">
        <el-option v-for="item in options" :label="item.title" :value="item.id"></el-option>
      </el-select>
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
    <el-form-item label="加盟内容" prop="content">
      <div class="editor-container">
        <UE   :config=config ref="ue"></UE>
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
        img: '',
        pic: '',
        create_time: '',
        order: '',
				content:''
      },
      options: [],
      uploadUrl: '',
      rules: {
        title: [{
          required: true,
          message: '请输入加盟名称',
          trigger: 'blur'
        }],
        pid:[{
          required: true,
          message: '请选择分类',
        }],
        desc: [{
          required: true,
          message: '请输入加盟描述信息',
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
          this.apiPost('admin/joins', this.form).then((res) => {
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
    getjoinsType() {
      this.apiGet('admin/joinstype').then((res) => {
        console.log(res)
        this.handelResponse(res, (data) => {
          this.options = this.options.concat(data)
        })
      })
    },
    getUEContent() {
      let content = this.$refs.ue.getUEContent();

       this.form.content = content

    },

    uploadSuccess(res, file, fileList) {
      this.form.pic = res.data
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
    uploadSuccess2(res, file, fileList2) {
      this.form.img = res.data
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
    this.getjoinsType()
    this.uploadUrl = window.HOST + 'admin/upload'
    _g.closeGlobalLoading()
  },

  mixins: [http, fomrMixin]
}
</script>
