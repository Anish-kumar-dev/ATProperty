//
//  ATPropertySettingPanelWindowController.m
//  ATProperty
//
//  Created by apple on 15/5/28.
//  Copyright (c) 2015年 DeltaX. All rights reserved.
//

#import "ATPSettingPanelWindowController.h"
#import "ATPropertySetting.h"

@interface ATPSettingPanelWindowController ()

@property (weak) IBOutlet NSButton *btnEnabled;
@property (weak) IBOutlet NSButton *btnUseNonatomic;
@property (weak) IBOutlet NSButton *atomicityPrefix;

@end

@implementation ATPSettingPanelWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    self.btnEnabled.state = (NSCellStateValue)[[ATPropertySetting defaultSetting] enabled];
    self.btnUseNonatomic.state = (NSCellStateValue)[[ATPropertySetting defaultSetting] useNonatomic];
    self.atomicityPrefix.state = (NSCellStateValue)[[ATPropertySetting defaultSetting] atomicityPrefix];
}

- (IBAction)btnEnabledPressed:(NSButton *)sender {
    [[ATPropertySetting defaultSetting] setEnabled:sender.state];
}

- (IBAction)btnUseNonatomicPressed:(NSButton *)sender {
    [[ATPropertySetting defaultSetting] setUseNonatomic:sender.state];
}

- (IBAction)btnAtomicityPrefixPressed:(NSButton *)sender {
    [[ATPropertySetting defaultSetting] setAtomicityPrefix:sender.state];
}

- (IBAction)btnResetPressed:(NSButton *)sender {
    [[ATPropertySetting defaultSetting] setUseNonatomic:YES];
    [[ATPropertySetting defaultSetting] setAtomicityPrefix:YES];
    [[ATPropertySetting defaultSetting] setEnabled:YES];
    self.btnUseNonatomic.state = (NSCellStateValue)[[ATPropertySetting defaultSetting] useNonatomic];
    self.atomicityPrefix.state = (NSCellStateValue)[[ATPropertySetting defaultSetting] atomicityPrefix];
    self.btnEnabled.state = (NSCellStateValue)[[ATPropertySetting defaultSetting] enabled];
}

@end
