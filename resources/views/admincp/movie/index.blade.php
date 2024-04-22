@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
        <a href="{{route('movie.create')}}" class="btn btn-primary">Thêm phim</a>
        <table class="table" id="tablephim">
            <thead>
                <tr>
                <th scope="col">#</th>
                <th scope="col">Title</th>
                <th scope="col">Slug</th>
                <th scope="col">Image</th>
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
