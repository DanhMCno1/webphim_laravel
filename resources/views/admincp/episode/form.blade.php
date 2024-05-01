@extends('layouts.app')
@section('content')
<div class="container-fluid">
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
                            <label name="movie">Chọn phim</label>
                            <div>
                                <select name="movie_id" class="form-control">
                                @if (!empty($episode))
                                @foreach ($episode as $list_movie => $value)
                                            <option $value= "{{ $list_movie }}" @if(isset($episode->movie_id) && $list_movie == $episode->movie_id ) checked @endif>{{ $value }}</option>
                                        @endforeach
                                    @endif

                                    
                                </select>
                            </div>
                        </div>
                        @if(!isset($movie))
                        <button type="submit" class="btn btn-primary">Thêm tập phim</button>
                        @else 
                        <button type="submit" class="btn btn-primary">Cập nhật tập phim</button>
                        @endif
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection
