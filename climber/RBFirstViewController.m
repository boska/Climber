//
//  RBFirstViewController.m
//  climber
//
//  Created by Boska on 7/23/13.
//  Copyright (c) 2013 Boska. All rights reserved.
//

#import "RBFirstViewController.h"
#import <SimpleKML.h>
#import <SimpleKMLContainer.h>
#import <SimpleKMLPlacemark.h>
#import <SimpleKMLPoint.h>
@interface RBFirstViewController ()

@end

@implementation RBFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    RMMapBoxSource *tileSource = [[RMMapBoxSource alloc] initWithMapID:@"boska.map-y3uht1ox"];
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:tileSource];
    mapView.delegate = self;
    [mapView setCenterCoordinate:CLLocationCoordinate2DMake(25.1249457813586, 121.60245180130005)];
    
    
    self.view = mapView;
    NSMutableArray *locations = [NSMutableArray array];
    NSString *kml = [[NSBundle mainBundle] pathForResource:@"wind" ofType:@"kml"];
    KMLRoot *root = [KMLParser parseKMLWithString:[NSString stringWithContentsOfFile:kml]];
    NSArray *aaa =root.placemarks;
    
    NSArray *cooordinates;
    for ( KMLPlacemark *p in aaa)
    {
    
        cooordinates = [(KMLLineString *)p.geometry coordinates];
        
        
    
    }
    for ( KMLCoordinate *coor in cooordinates)
    {
        CLLocation *loca = [[CLLocation alloc]initWithLatitude:coor.latitude longitude:coor.longitude];
        [locations addObject:loca];
    }
//    SimpleKML *kml = [SimpleKML KMLWithContentsOfFile:@"/Users/Boska/Projects/climber/climber/routes/wind.kml" error:nil];
//     for (SimpleKMLFeature *feature in ((SimpleKMLContainer *)kml.feature).features)
//     {
//         if ([feature isKindOfClass:[SimpleKMLPlacemark class]] && ((SimpleKMLPlacemark *)feature).point)
//         {
//             SimpleKMLPoint *point = ((SimpleKMLPlacemark *)feature).point;
//             
//             // create a normal point annotation for it
//             //
//             CLLocation *location =[[CLLocation alloc]initWithLatitude:point.coordinate.latitude longitude:point.coordinate.longitude];
//             [locations addObject:location];
//         }
//     }
    RMAnnotation *annotation = [[RMAnnotation alloc] initWithMapView:mapView
                                                          coordinate:((CLLocation *)[locations objectAtIndex:0]).coordinate
                                                            andTitle:@"Start"];
    [mapView setCenterCoordinate:annotation.coordinate];
    annotation.userInfo = locations;
    
    [annotation setBoundingBoxFromLocations:locations];
    
    [mapView addAnnotation:annotation];
    
   
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    if (annotation.isUserLocationAnnotation)
        return nil;
    
    RMShape *shape = [[RMShape alloc] initWithView:mapView];
    
    shape.lineColor = [UIColor whiteColor];
    shape.lineWidth = 5.0;
    
    for (CLLocation *location in (NSArray *)annotation.userInfo)
        [shape addLineToCoordinate:location.coordinate];
    
    return shape;
}
@end
