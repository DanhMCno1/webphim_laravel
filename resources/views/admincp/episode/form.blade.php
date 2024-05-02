@extends('layouts.app')
@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Quản lý tập phim') }}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif
                    @if(!isset($episode))
                    <form action="{{route('episode.store')}}" method="POST" enctype="multipart/form-data">
                    @else
                    <form action="{{route('episode.update', ['id' => $episode->id])}}" method="POST" enctype="multipart/form-data">
                    @endif
                        @csrf
                        <div>
                            <label for="movie">Chọn phim</label>
                            <div>
                                @if (!empty($list_movie))
                                @if(!empty($episode->movie->title))
                                <input class="form-control" value="{{$episode->movie->title}}" readonly>
                                <input name="movie_id" value="{{$episode->movie->id}}" hidden>
                                @else
                                <select name="movie_id" class="form-control select-movie">
                                            @foreach ($list_movie as $id => $title)
                                                <option value="{{ $id }}" @if(!empty($episode->movie_id) && $id == $episode->movie_id ) checked @endif>{{ $title }}</option>
                                            @endforeach
                                        @endif
                                    @endif
                                </select>
                            </div>
                        </div>
                        <div>
                            <label for="link" >Link phim</label>
                            <input type="text" name="link" class="form-control" placeholder="..." value="{{!empty($episode->linkphim) ? $episode->linkphim : '' }}">
                        </div>
                        
                        <div>
                            <label for="episode">Tập phim</label>
                            @if(isset($episode->episode))
                            <input name="episode" id="show_movie" class="form-control" value="{{$episode->episode}}" readonly>
                            @else 
                            <select name="episode" id="show_movie" class="form-control" ></select>
                            @endif
                        </div>
                        @if(!isset($episode))
                        <button type="submit" class="btn btn-primary">Thêm tập phim</button>
                        @else
                        <button type="submit" class="btn btn-primary">Cập nhật tập phim</button>
                        @endif
                    </form>
                </div>
            </div>
            <table class="table">
                <thead>
                    <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tên phim</th>
                    <th scope="col">Tập phim</th>
                    <th scope="col">Link phim</th>
                    <th scope="col">Quản lý</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($list_episode as $key => $episode)
                    <tr>
                    <th scope="row">{{$key}}</th>
                    <td>{{$episode->movie->title}}</td>
                    <td>{{$episode->episode}}</td>
                    <td>{!!$episode->linkphim!!}</td>
                    <td>
                    <form action="{{route('episode.destroy', ['id' => $episode->id])}}" method="POST">
                            @csrf
                            <button type="submit" class="btn btn-danger">Xóa</button>
                        </form>
                        <form action="{{route('episode.edit', ['id' => $episode->id])}}">
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