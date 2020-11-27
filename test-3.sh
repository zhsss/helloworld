 
#!/bin/bash


- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
- (BOOL)textFieldShouldReturn:(UITextField*)textField{
    [textField resignFirstResponder];
    return YES;
}
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:)  name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
}
-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self  name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self  name:UIKeyboardDidHideNotification object:nil];
}-(void)keyboardDidShow:(NSNotification*)notification{
    NSLog(@"open keyboard");
}
-(void)keyboardDidHide:(NSNotification*)notification{
    NSLog(@"close keyboard");
}- (BOOL)textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}






2
- (void)switchValueChanged:(id)sender{
    UISwitch*witchSwitch=(UISwitch*)sender;
    BOOL setting=witchSwitch.isOn;
    [self.leftSwitch setOn:setting animated:TRUE];
    [self.rightSwitch setOn:setting animated:TRUE];
}
- (IBAction)touchDown:(id)sender{
    UISegmentedControl *s=(UISegmentedControl*)sender;
    NSLog(@"switch is:%li",s.selectedSegmentIndex);
    if(s.selectedSegmentIndex){
        self.rightSwitch.hidden=FALSE;
        self.leftSwitch.hidden=FALSE;
        self.rightSwitch.backgroundColor=[UIColor blueColor];
        self.leftSwitch.backgroundColor=[UIColor blueColor];
    }else{
        self.leftSwitch.hidden=TRUE;
        self.rightSwitch.hidden=TRUE;
        self.rightSwitch.backgroundColor=[UIColor yellowColor];
        self.leftSwitch.backgroundColor=[UIColor yellowColor];
    }
}
- (IBAction)sliderValueChange:(id)sender{
    UISlider*slider=(UISlider*)sender;
    int progressAsInt=(int)(slider.value);
    NSString*newText=[[NSString alloc]initWithFormat:@"%i",progressAsInt];
    NSLog(@"value of slider:%@",newText);
}




3
-(void)testLoadHTMLString:(id)sender{
    NSString *htmlPath=[[NSBundle mainBundle]pathForResource:@"index" ofType:@"html"];
    NSURL*bundleUrl=[NSURL fileURLWithPath:[[NSBundle mainBundle]bundlePath]];
    NSError*error=nil;
    NSString*html=[[NSString alloc]initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:&error];
    if(error==nil){
        [self.webView loadHTMLString:html baseURL:bundleUrl];
        NSLog(@"LoadHtmlString success");
    }else
        NSLog(@"%@",error);
}

- (void)testLoadData:(id)sender{
    NSString *htmlPath=[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *bundleUrl =[NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
    NSData*htmlData=[[NSData alloc]initWithContentsOfFile:htmlPath];
    [self.webView loadData:htmlData MIMEType:@"text/html" characterEncodingName:@"UTF_8" baseURL:bundleUrl];
    NSLog(@"LoadData-over");
}
-(void)testLoadRequest:(id)sender{
    NSURL*url=[NSURL URLWithString:@"https://www.163.com"];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.navigationDelegate=self;
    [self.view addSubview:self.webView];
    
}
-(void)webView:(WKWebView*)webView didStartProvisionalNavigation:(WKNavigation*)navigation{
    NSLog(@"start load");
}
-(void)webView:(WKWebView*)webView didCommitNavigation:(WKNavigation*)navigation{
    NSLog(@"begin return");
}
-(void)webView:(WKWebView*)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"load success");
}

-(void)webView:(WKWebView*)webView didFailProvisionNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    NSLog(@"load failed error:%@",error.description);
}




4
-(void)testAlertView:(id)sender{
    UIAlertController*alertController=[UIAlertController alertControllerWithTitle:@"Alert" message:@"Alert test goes here" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction*noAction=[UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"Tap No Button");
    }];
    UIAlertAction*yesAction=[UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        NSLog(@"Tap Yes Button");
    }];
    [alertController addAction:noAction];
    [alertController addAction:yesAction];
    [self presentViewController:alertController animated:TRUE completion:nil];
}
-(void)testActionSheet:(id)sender{
    UIAlertController*actionSheetController=[[UIAlertController alloc]init];
    UIAlertAction*cancelAction=[UIAlertAction actionWithTitle:@"undo" style:UIAlertActionStyleCancel handler:^(UIAlertAction*action){
        NSLog(@"Tap uodo Button");
    }];
    UIAlertAction*destructiveAction=[UIAlertAction actionWithTitle:@"destruct" style:UIAlertActionStyleDestructive handler:^(UIAlertAction*action){
        NSLog(@"Tap destruct Button");
    }];
    UIAlertAction*otherAction=[UIAlertAction actionWithTitle:@"weChatPyq" style:UIAlertActionStyleDefault handler:^(UIAlertAction*action){
        NSLog(@"Tap weChatPyq Button");
    }];
    [actionSheetController addAction:cancelAction];
    [actionSheetController addAction:destructiveAction];
    [actionSheetController addAction:otherAction];
    
    actionSheetController.popoverPresentationController.sourceView=sender;
    [self presentViewController:actionSheetController animated:TRUE completion:nil];
}



5
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect Screen=[[UIScreen mainScreen]bounds];
    CGFloat labelWidth=90;
    CGFloat labelHeight=20;
    CGFloat labelTopView=150;
    CGRect labelFrame=CGRectMake((Screen.size.width-labelWidth)/2, labelTopView, labelWidth, labelHeight);
   self.label=[[UILabel alloc] initWithFrame:labelFrame];
    self.label.text=@"Label";
    self.label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    CGFloat toolbarHeight=44;
    UIToolbar*toolbar=[[UIToolbar alloc]initWithFrame:CGRectMake(0, Screen.size.height-toolbarHeight, Screen.size.height, toolbarHeight)];
    UIBarButtonItem*saveButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self  action:@selector(save:)];
    UIBarButtonItem*openButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"open" style: UIBarButtonItemStylePlain target:self action:@selector(open:)];
    UIBarButtonItem*flexibleButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    flexibleButtonItem.width=200;
    toolbar.items=@[saveButtonItem,flexibleButtonItem,openButtonItem];
    [self.view addSubview:toolbar];
    
    
    UINavigationBar*navigationBar=[[UINavigationBar alloc]initWithFrame:CGRectMake(0, 20, Screen.size.width, 44)];
    UIBarButtonItem*saveButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    UIBarButtonItem*addButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add:)];
    UINavigationItem*navigationItem=[[UINavigationItem alloc]initWithTitle:@""];
    navigationItem.leftBarButtonItem=saveButton;
    navigationItem.rightBarButtonItem=addButtonItem;
    navigationBar.items=@[navigationItem];
    [self.view addSubview:navigationBar];
    
}


6
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect Screen=[[UIScreen mainScreen] bounds];
    self.activityIndicatorView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    CGRect frame=self.activityIndicatorView.frame;
    frame.origin=CGPointMake((Screen.size.width-frame.size.width)/2, 84);
    self.activityIndicatorView.frame=frame;
    self.activityIndicatorView.hidesWhenStopped=false;
    [self.view addSubview:self.activityIndicatorView];
    
    UIButton*button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Upload" forState:UIControlStateNormal];
    CGFloat buttonWidth=60;
    CGFloat buttonHeight=20;
    CGFloat buttonTopView=120;
    button.frame=CGRectMake((Screen.size.width-buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
    [button addTarget:self  action:@selector(startToMove:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    
    self.progressView=[[UIProgressView alloc]initWithFrame:CGRectMake((Screen.size.width-200)/2, 283, 200, 2)];
    [self.view addSubview:self.progressView];
    
    UIButton*button1=[UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"Download" forState:UIControlStateNormal];
 
    buttonTopView=340;
    button1.frame=CGRectMake((Screen.size.width-buttonWidth)/2, buttonTopView, buttonWidth, buttonHeight);
    [button1 addTarget:self  action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
}
-(IBAction)startToMove:(id)sender{
    if(self.activityIndicatorView.isAnimating){
        [self.activityIndicatorView stopAnimating];
    }else{
        [self.activityIndicatorView startAnimating];
    }
}
-(void)download:(id)sender{
    self.progressView.progress=self.progressView.progress+0.1;
    if(self.progressView.progress==1.0){
        [self.timer invalidate];
        UIAlertController*alertContaoller=[UIAlertController alertControllerWithTitle:@"download completed" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction*okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertContaoller addAction:okAction];
        [self presentViewController:alertContaoller animated:true completion:nil];
    }
}
