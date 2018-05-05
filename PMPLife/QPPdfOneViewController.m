//
//  QPPdfOneViewController.m
//  PMPLife
//
//  Created by ChenQianPing on 16/3/25.
//  Copyright © 2016年 ChenQianPing. All rights reserved.
//

#import "QPPdfOneViewController.h"
#import "Utilities.h"
#import "LeavesView.h"

@interface QPPdfOneViewController ()

@property (readonly) CGPDFDocumentRef pdf;

@end

@implementation QPPdfOneViewController

- (id)init {
    if (self = [super init]) {
        CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("1-10-3 魏书十 贾诩传.pdf"), NULL, NULL);
        // 创建CFPDFDocument对象
        _pdf = CGPDFDocumentCreateWithURL(pdfURL);
        CFRelease(pdfURL);
        
        self.leavesView.backgroundRendering = YES;
        [self displayPageNumber:1];
    }
    return self;
}

- (void)dealloc {
    CGPDFDocumentRelease(_pdf);
}

- (void)displayPageNumber:(NSUInteger)pageNumber {
    self.navigationItem.title = [NSString stringWithFormat:
                                 @"Page %lu of %lu",
                                 (unsigned long)pageNumber,
                                 CGPDFDocumentGetNumberOfPages(_pdf)];
}

#pragma mark LeavesViewDelegate

- (void)leavesView:(LeavesView *)leavesView willTurnToPageAtIndex:(NSUInteger)pageIndex {
    [self displayPageNumber:pageIndex + 1];
}

#pragma mark LeavesViewDataSource

- (NSUInteger)numberOfPagesInLeavesView:(LeavesView*)leavesView {
    // 获取文档页数
    return CGPDFDocumentGetNumberOfPages(_pdf);
}

- (void)renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
    
//    CGPDFPageRef page = CGPDFDocumentGetPage(_pdf, index + 1);
//    CGAffineTransform transform = aspectFit(CGPDFPageGetBoxRect(page, kCGPDFMediaBox),
//                                            CGContextGetClipBoundingBox(ctx));
//    CGContextConcatCTM(ctx, transform);
//    CGContextDrawPDFPage(ctx, page);

    // 获取指定页的PDF文档
    CGPDFPageRef page = CGPDFDocumentGetPage(_pdf, index + 1);
    // Quartz提供了函数CGPDFPageGetDrawingTransform来创建一个仿射变换，该变换基于将PDF页的BOX映射到指定的矩形中。
    CGAffineTransform pdfXfm =CGPDFPageGetDrawingTransform( page, kCGPDFCropBox, self.view.bounds, 0, true);
    // 缩放,x方向缩放0.5倍,y方向缩放1.5倍
    CGContextScaleCTM(ctx, 1, 1);
    CGContextSaveGState(ctx);
    CGContextConcatCTM( ctx, pdfXfm );
    // 将PDF绘制到图形上下文中
    CGContextDrawPDFPage( ctx,page );
    CGContextRestoreGState(ctx);
}
@end
