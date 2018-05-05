//
//  ZPDFView.m
//  pdfReader
//
//  Created by XuJackie on 15/6/6.
//  Copyright (c) 2015年 peter. All rights reserved.
//

#import "ZPDFView.h"

@implementation ZPDFView

- (id)initWithFrame:(CGRect)frame atPage:(int)index withPDFDoc:(CGPDFDocumentRef) pdfDoc{
    self = [super initWithFrame:frame];
    pageNO = index;
    pdfDocument = pdfDoc;
    return self;
}

- (void)drawInContext:(CGContextRef)context atPageNo:(int)page_no{
    // PDF page drawing expects a Lower-Left coordinate system, so we flip the coordinate system
    // before we start drawing.
    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    int pageSum = CGPDFDocumentGetNumberOfPages(pdfDocument);
    NSLog(@"pageSum = %d", pageSum);
    if (pageNO == 0) {
        pageNO = 1;
    }
    
    // Grab the first PDF page
    CGPDFPageRef page = CGPDFDocumentGetPage(pdfDocument, pageNO);
    // We're about to modify the context CTM to draw the PDF page where we want it, so save the graphics state in case we want to do more drawing
    CGContextSaveGState(context);
    // CGPDFPageGetDrawingTransform provides an easy way to get the transform for a PDF page. It will scale down to fit, including any
    // base rotations necessary to display the PDF page correctly.
    CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(page, kCGPDFCropBox, self.bounds, 0, true);
    // And apply the transform.
    CGContextConcatCTM(context, pdfTransform);
    // Finally, we draw the page and restore the graphics state for further manipulations!
    CGContextDrawPDFPage(context, page);
    CGContextRestoreGState(context);
}

- (void)drawRect:(CGRect)rect {
    [self drawInContext:UIGraphicsGetCurrentContext() atPageNo:pageNO];
}

@end
