//
//  ShowVC.m
//  Photos使用
//
//  Created by 软件开发部2 on 2018/3/22.
//  Copyright © 2018年 软件开发部2. All rights reserved.
//

#import "ShowVC.h"
#import "PhotosTool.h"
#import <PhotosUI/PhotosUI.h>
@interface ShowVC ()<PHLivePhotoViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *poster;
@property (nonatomic,strong) PHLivePhotoView *liveView;

@end

@implementation ShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadImage];
}
- (void)setupUI {
    _liveView = [[PHLivePhotoView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:_liveView];
    _liveView.delegate = self;
    _liveView.hidden = YES;
}
- (void)loadImage {
    if (_asset.mediaSubtypes == PHAssetMediaSubtypePhotoLive) {
        _liveView.hidden = NO;
        PHLivePhotoRequestOptions *option = [[PHLivePhotoRequestOptions alloc] init];
        option.networkAccessAllowed = YES;
        [[PHImageManager defaultManager] requestLivePhotoForAsset:_asset targetSize:CGSizeMake(_asset.pixelWidth, _asset.pixelHeight) contentMode:PHImageContentModeAspectFit options:option resultHandler:^(PHLivePhoto * _Nullable livePhoto, NSDictionary * _Nullable info) {
            _liveView.livePhoto = livePhoto;
            [_liveView startPlaybackWithStyle:PHLivePhotoViewPlaybackStyleFull];
        }];
       
    }else {
        [[PhotosTool sharedTool] requestImgaeWithSize:CGSizeMake(_asset.pixelWidth, _asset.pixelHeight) andAsset:_asset andCompletionHandler:^(UIImage *result) {
            _poster.image = result;
        }];
    }
   
   
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    [[PhotosTool sharedTool] requestDataForLivePhotoWithAsset:_asset andCompletion:^(NSString *imagePath, NSString *videoPath) {
       
    }];
}
#pragma mark - PHLivePhotoViewDelegate
- (void)livePhotoView:(PHLivePhotoView *)livePhotoView willBeginPlaybackWithStyle:(PHLivePhotoViewPlaybackStyle)playbackStyle {
    
}

- (void)livePhotoView:(PHLivePhotoView *)livePhotoView didEndPlaybackWithStyle:(PHLivePhotoViewPlaybackStyle)playbackStyle {
    
}
@end
