@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Quản lý phim') }}</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if(!isset($movie))
                    <form action="{{route('movie.store')}}" method="POST" enctype="multipart/form-data">
                    @else 
                    <form action="{{route('movie.update', ['id' => $movie->id])}}" method="POST" enctype="multipart/form-data">
                    @endif
                        @csrf
                        <div>
                            <label>Title</label>
                            <div>
                                <input id="slug" name="title" class="form-control" type="text" placeholder="Nhập tiêu đề" value="{{ isset($movie->title) ? $movie->title : '' }}" onkeyup="ChangeToSlug()">
                            </div>
                        </div>
                        <div>
                            <label>Tên tiếng anh</label>
                            <div>
                                <input name="name_eng" class="form-control" type="text" placeholder="Nhập tiêu đề" value="{{ isset($movie->name_eng) ? $movie->name_eng : '' }}">
                            </div>
                        </div>
                        <div>
                            <label>Slug</label>
                            <div>
                                <input id="convert_slug" name="slug" class="form-control" type="text" placeholder="Nhập tiêu đề" value="{{ isset($movie->slug) ? $movie->slug : '' }}">
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
                            >{{ isset($movie->description) ? $movie->description : '' }}</textarea>
                            </div>
                        </div>
                        <div>
                            <label name="active">Active</label>
                            <div>
                                <select name="status" class="form-control">
                                    <option value="1" @if(!empty($movie->status) && $movie->status == 1) checked @endif>Hiển thị</option>
                                    <option value="0" @if(!empty($movie->status) && $movie->status == 0) checked @endif>Ẩn</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <label name="category">Category</label>
                            <div>
                                <select name="category_id" class="form-control">
                                    @if (!empty($category))
                                        @foreach ($category as $key => $value)
                                            <option value="{{ $key }}" @if(isset($movie->category_id) && $key == $movie->category_id) checked @endif>{{ $value }}</option>
                                        @endforeach
                                    @endif
                                </select>
                            </div>
                        </div>
                        <div>
                            <label name="genre">Genre</label>
                            <div>
                            <select name="genre_id" class="form-control">
                                    @if (!empty($genre))
                                        @foreach ($genre as $key => $value)
                                            <option value="{{ $key }}" @if(isset($movie->genre_id) && $key == $movie->genre_id) checked @endif>{{ $value }}</option>
                                        @endforeach
                                    @endif
                                </select>
                            </div>
                        </div>
                        <div>
                            <label name="country">Country</label>
                            <div>
                            <select name="country_id" class="form-control">
                                    @if (!empty($country))
                                        @foreach ($country as $key => $value)
                                            <option value="{{ $key }}" @if(isset($movie->country_id) && $key == $movie->country_id) checked @endif>{{ $value }}</option>
                                        @endforeach
                                    @endif
                                </select>
                            </div>
                        </div>
                        <div>
                            <label name="Hot">Hot</label>
                            <div>
                                <select name="phim_hot" class="form-control">
                                    <option value="1" @if(!empty($movie->phim_hot) && $movie->phim_hot == 1) checked @endif>Có</option>
                                    <option value="0" @if(!empty($movie->phim_hot) && $movie->phim_hot == 0) checked @endif>Không</option>
                                </select>
                            </div>
                        </div>
                        <div>
                            <label name="image">Image</label>
                            <div>
                                <input name="image" type="file" class="forn-controller-file">
                            </div>
                            
                        </div>
                        @if(!isset($movie))
                        <button type="submit" class="btn btn-primary">Thêm dữ liệu</button>
                        @else 
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                        @endif
                    </form>
                </div>
            </div>
            <table class="table" id="tablephim">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Title</th>
      <th scope="col">Slug</th>
      <th scope="col">Image</th>
      <th scope="col">Hot</th>
      <!-- <th scope="col">Description</th> -->
      <th scope="col">Active/Inactive</th>
      <th scope="col">Category</th>
      <th scope="col">Genre</th>
      <th scope="col">Country</th>
      <th scope="col">Manage</th>
    </tr>
  </thead>
  <tbody>
  @foreach($list as $key =>$cate)
    <tr>
      <th scope="row">{{$key}}</th>
      <td>{{$cate->title}}</td>  
      <td>{{$cate->slug}}</td>  
      <td><img width="100px" src="{{asset('public/uploads/movie/'.$cate->image)}}"></td>  
      <!-- <td>{{$cate->description}}</td> -->
      <td>
        @if($cate->phim_hot==0)
            Không
        @else
            Có
        @endif
      </td>
      <td>
        @if($cate->status)
            Hiển thị
        @else
            Ẩn
        @endif
      </td>
      <td>{{$cate->category->title}}</td>  
      <td>{{$cate->genre->title}}</td>  
      <td>{{$cate->country->title}}</td>  
      <td>
      <form action="{{route('movie.destroy', ['id' => $cate->id])}}" method="POST">
            @csrf
            <button type="submit" class="btn btn-danger">Xóa</button>
        </form>
        <form action="{{route('movie.edit', ['id' => $cate->id])}}">
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
