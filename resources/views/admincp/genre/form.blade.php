@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Quản lý thể loại') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if(!isset($genre))
                    <form action="{{route('genre.store')}}" method="POST">
                    @else 
                    <form action="{{route('genre.update', ['id' => $genre->id])}}" method="POST">
                    @endif
                        @csrf
                        <div>
                            <label>Title</label>
                            <div>
                                <input id="slug" name="title" class="form-control" type="text" placeholder="Nhập tiêu đề" value="{{ isset($genre->title) ? $genre->title : '' }}" onkeyup="ChangeToSlug()">
                            </div>
                        </div>
                        <div>
                            <label>Slug</label>
                            <div>
                                <input id="convert_slug" name="slug" class="form-control" type="text" placeholder="Nhập tiêu đề" value="{{ isset($genre->slug) ? $genre->slug : '' }}">
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
                            >{{ isset($genre->description) ? $genre->description : '' }}</textarea>
                            </div>
                        </div>
                        <div>
                            <label name="active">Active</label>
                            <div>
                                <select name="status" class="form-control">
                                    <option value="1" @if(!empty($genre->status) && $genre->status == 1) checked @endif>Hiển thị</option>
                                    <option value="0" @if(!empty($genre->status) && $genre->status == 0) checked @endif>Ẩn</option>
                                </select>
                            </div>
                        </div>
                        @if(!isset($genre))
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
      <th scope="col">Tiêu đề</th>
      <th scope="col">Key</th>
      <th scope="col">Mô tả</th>
      <th scope="col">Hoạt động</th>
      <th scope="col">Quản lý</th>
    </tr>
  </thead>
  <tbody>
  @foreach($list as $key =>$cate)
    <tr>
      <th scope="row">{{$key}}</th>
      <td>{{$cate->title}}</td>
      <td>{{$cate->description}}</td>
      <td>{{$cate->slug}}</td>
      <td>
        @if($cate->status)
            Hiển thị
        @else
            Ẩn
        @endif
      </td>
      <td>
      <form action="{{route('genre.destroy', ['id' => $cate->id])}}" method="POST">
            @csrf
            <button type="submit" class="btn btn-danger">Xóa</button>
        </form>
        <form action="{{route('genre.edit', ['id' => $cate->id])}}">
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
