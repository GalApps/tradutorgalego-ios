//
//  Parser.m
//  DicionarioGalego
//
//  Created by Xurxo Méndez Pérez on 06/01/12.
//  Copyright (c) 2012 ninguna. All rights reserved.
//

#import "Parser.h"
#import "HTMLParser.h"
#import "HTMLNode.h"

@implementation Parser

@synthesize text;


-(NSString *)parse:(NSString *) theText {
    if ([theText rangeOfString:@"Non se atopou o termo."].location != NSNotFound) {
        return nil;
    }
    NSError *error = nil;
    HTMLParser *parser = [[HTMLParser alloc] initWithString:theText error:&error];

    if (error) {
        NSLog(@"Error: %@", error);
        return @"<html><head><body>Error</body></html>";
    }
    HTMLNode *bodyNode = [parser body];

    HTMLNode *iframe = [[bodyNode findChildTags:@"iframe"] objectAtIndex:0];
    
    return [iframe contents];
//        NSArray *fontNodes = [bodyNode findChildTags:@"font"];
//        // Sólo debe haber uno, el que nos interesa
//        for (HTMLNode *fontNode in fontNodes) {
//            NSString* size = [fontNode getAttributeNamed:@"size"];
//            if ([size isEqualToString:@"2"]) {
//                NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
//                BOOL firstTerm = TRUE;
//                BOOL isVerb = FALSE;
//                for (HTMLNode *child in [fontNode children]) {
//                    NSMutableString *tagName = [[NSMutableString alloc] initWithString:[child tagName]];
//                    if ([tagName isEqualToString:@"br"]) {
//                        
//                    }
//                    if (!isVerb && [tagName isEqualToString:@"i"]) {
//                        if ([[child contents] rangeOfString:@"v.i."].location != NSNotFound ||
//                            [[child contents] rangeOfString:@"v.t."].location != NSNotFound ||
//                            [[child contents] rangeOfString:@"v.p."].location != NSNotFound) {
//                            isVerb = TRUE;
//                        }
//                    }
//                    if ([tagName isEqualToString:@"b"]) {
//                        // Si es un número
//                        if ([f numberFromString: [child contents]] != nil) {
//
//                        }
//                        else if ([[child contents] caseInsensitiveCompare:self.text] == NSOrderedSame) {
//                            if (!firstTerm) {
//                                
//                            }
//                            else {
//                                firstTerm = FALSE;
//                            }
//                        }
//                    }
//                }
//                
//                NSMutableString *html = [[NSMutableString alloc] initWithString:@"<html><head><link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\" /></head><body><div class=\"title\"><div class=\"text\">"];
//                [html appendString:[NSString stringWithFormat:@"%@%@",
//                                    [[self.text substringToIndex:1] uppercaseString],
//                                    [[self.text substringFromIndex:1] lowercaseString]]];
//                [html appendString:@"</div></div><div class=\"content\">"];
//                [html appendString:[fontNode rawContents]];
//                [html appendString:@"</div></body></html>"];
//                [html replaceOccurrencesOfString:@"¿"
//                                      withString:@""
//                                         options:0
//                                           range:NSMakeRange(0, [html length])];
//                [html replaceOccurrencesOfString:@"<font face=\"Arial, Helvetica, sans-serif\">"
//                                      withString:@""
//                                         options:0
//                                           range:NSMakeRange(0, [html length])];
//                [html replaceOccurrencesOfString:@"<font face=\"Zapf Dingbats\" size=\"2\">"
//                                      withString:@""
//                                         options:0
//                                           range:NSMakeRange(0, [html length])];
//                [html replaceOccurrencesOfString:@"<font size=\"[0-9]\">"
//                                      withString:@""
//                                         options:0
//                                           range:NSMakeRange(0, [html length])];
//                [html replaceOccurrencesOfString:@"</font>"
//                                      withString:@""
//                                         options:0
//                                           range:NSMakeRange(0, [html length])];
//                [html replaceOccurrencesOfString:@"<font size=\"2\">"
//                                      withString:@""
//                                         options:0
//                                           range:NSMakeRange(0, [html length])];
//                [html replaceOccurrencesOfString:@"&iquest"
//                                      withString:@""
//                                         options:0
//                                           range:NSMakeRange(0, [html length])];
//                for (int i = 1; i < 100; i++) {
//                    NSString *s = [NSString stringWithFormat:@"%@%d%@", @"<b>", i, @"</b>"];
//                    NSString *s2 = [NSString stringWithFormat:@"%@%d%@", @"<b class=\"number\">", i, @"</b>"];
//                    [html replaceOccurrencesOfString:s
//                                                withString:s2 
//                                                   options:0
//                                                     range:NSMakeRange(0, [html length])];
//                    NSString *s3 = [NSString stringWithFormat:@"%@%d%@", @"<sup>", i, @"</sup>"];
//                    [html replaceOccurrencesOfString:s3
//                                          withString:@"" 
//                                             options:0
//                                               range:NSMakeRange(0, [html length])];
//                }
//                NSLog(@"%@", html);
//                return html;
//            }
//        }
//        
//    
//    return text;
}

@end
