@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Quản lý danh mục') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if(!isset($category))
                    <form action="{{route('category.store')}}" method="POST">
                    @else 
                    <form action="{{route('category.update', ['id' => $category->id])}}" method="POST">
                    @endif
                        @csrf
                        <div>
                            <label>Title</label>
                            <div>
                                <input id="slug" name="title" class="form-control" type="text" placeholder="Nhập tiêu đề" value="{{ isset($category->title) ? $category->title : '' }}" 
                                onkeyup="ChangeToSlug()">
                            </div>
                        </div>
                        <div>
                            <label>Slug</label>
                            <div>
                                <input id="convert_slug" name="slug" class="form-control" type="text" placeholder="Nhập tiêu đề" value="{{ isset($category->slug) ? $category->slug : '' }}">
                            </div>
                        </div>
                        <div>
                            <label>Description</label>
                            <div>
                            <textarea id="description" 
                                name="description" 
                                class="form-control"
                                placeholder="Nhập nội dung" 
                                rows="10"
                            >{{ isset($category->description) ? $category->description : '' }}</textarea>
                            </div>
                        </div>
                        <div>
                            <label name="active">Active</label>
                            <div>
                                <select name="status" class="form-control">
                                    <option value="1" @if(!empty($category->status) && $category->status == 1) checked @endif>Hiển thị</option>
                                    <option value="0" @if(!empty($category->status) && $category->status == 0) checked @endif>Ẩn</option>
                                </select>
                            </div>
                        </div>
                        @if(!isset($category))
                        <button type="submit" class="btn btn-primary">Thêm dữ liệu</button>
                        @else 
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                        @endif
                    </form>
                </div>
            </div>
            <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Title</th>
      <th scope="col">Slug</th>
      <th scope="col">Active/Inactive</th>
      <th scope="col">Manage</th>
    </tr>
  </thead>
  <tbody class="order_position">
  @foreach($list as $key =>$cate)
    <tr id="{{$cate->id}}">
      <th scope="row">{{$key}}</th>
      <td>{{$cate->title}}</td>
      <td>{{$cate->slug}}</td>
      <td>
        @if($cate->status)
            Hiển thị
        @else
            Ẩn
        @endif
      </td>
      <td>
      <form action="{{route('category.destroy', ['id' => $cate->id])}}" method="POST">
            @csrf
            <button type="submit" class="btn btn-danger">Xóa</button>
        </form>
        <form action="{{route('category.edit', ['id' => $cate->id])}}">
            <button type="submit" class="btn btn-warning">Sửa</button>
        </form>
      </td>

    </tr>
    @endforeach
  </tbody>
</table>
        </div>
    </div>
</div>

@endsection
