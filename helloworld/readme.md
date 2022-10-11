# Hello World terraform

Terraformを使ってみよう

Terraformを使って、ローカルに helloworld.txt というファイルを作成してみます

## files
```
.
├── main.tf    < terraform file
└── readme.md  < readme
```

## Usage
1. 作業フォルダにディレクトリを移動します
  ```
  cd hello-terraform
  ```

2. Terraformを実行する前にかならず必要な作業ディレクトリの初期化を行います

  ```
  terraform init
  ```

  実行結果
  ```
  Initializing the backend...

  Initializing provider plugins...
  - Finding latest version of hashicorp/local...
  - Installing hashicorp/local v2.2.3...
  - Installed hashicorp/local v2.2.3 (signed by HashiCorp)

  Terraform has created a lock file .terraform.lock.hcl to record the provider
  selections it made above. Include this file in your version control repository
  so that Terraform can guarantee to make the same selections by default when
  you run "terraform init" in the future.

  Terraform has been successfully initialized!

  You may now begin working with Terraform. Try running "terraform plan" to see
  any changes that are required for your infrastructure. All Terraform commands
  should now work.

  If you ever set or change modules or backend configuration for Terraform,
  rerun this command to reinitialize your working directory. If you forget, other
  commands will detect it and remind you to do so if necessary.
  ```

3. 適用前に計画を実行し、変更内容を確認します

  ```
  terraform plan
  ```

  実行結果
  ```
  Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

  Terraform will perform the following actions:

    # local_file.helloworld will be created
    + resource "local_file" "helloworld" {
        + content              = "Hello World!"
        + directory_permission = "0777"
        + file_permission      = "0777"
        + filename             = "helloworld.txt"
        + id                   = (known after apply)
      }

  Plan: 1 to add, 0 to change, 0 to destroy.

  Changes to Outputs:
    + file_name = "helloworld.txt"
    + message   = "Hello World!"

  ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

  Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply"
  now.
  ```

  `Plan: 1 to add, 0 to change, 0 to destroy.` の行から、１つのリソースが追加されることがわかります

  `+ resource "local_file" "helloworld" {` の行から、追加されるリソースは local_file.helloworld だとわかります


4. 計画にて予定どおり１つのローカルファイルを作成することが確認できたので、適用します
  
  ```
  terraform apply
  ```

  実行結果
  ```
  Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

  Terraform will perform the following actions:

    # local_file.helloworld will be created
    + resource "local_file" "helloworld" {
        + content              = "Hello World!"
        + directory_permission = "0777"
        + file_permission      = "0777"
        + filename             = "helloworld.txt"
        + id                   = (known after apply)
      }

  Plan: 1 to add, 0 to change, 0 to destroy.

  Changes to Outputs:
    + file_name = "helloworld.txt"
    + message   = "Hello World!"

  Do you want to perform these actions?
    Terraform will perform the actions described above.
    Only 'yes' will be accepted to approve.

    Enter a value: yes   　　　　　　　　　　　　　# <- 実行される内容を確認して yes を入力します

  local_file.helloworld: Creating...
  local_file.helloworld: Creation complete after 0s [id=2ef7bde608ce5404e97d5f042f95f89f1c232871]

  Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

  Outputs:

  file_name = "helloworld.txt"
  message = "Hello World!"
  ```

4. 実行結果の確認
   
  ```
  .
  ├── helloworld.txt      <- Terraformによって作成されたファイル
  ├── main.tf
  ├── readme.md
  └── terraform.tfstate   <- Terraformが管理しているリソースの現在の状態を表すファイル
  ```

  helloworld.txt
  ```
  $ cat helloworld.txt
  Hello World!% 
  ```


5. お掃除
   
   ```
   terraform destroy
   ```
   
   実行結果
    ```
    local_file.helloworld: Refreshing state... [id=2ef7bde608ce5404e97d5f042f95f89f1c232871]

    Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
      - destroy

    Terraform will perform the following actions:

      # local_file.helloworld will be destroyed
      - resource "local_file" "helloworld" {
          - content              = "Hello World!" -> null
          - directory_permission = "0777" -> null
          - file_permission      = "0777" -> null
          - filename             = "helloworld.txt" -> null
          - id                   = "2ef7bde608ce5404e97d5f042f95f89f1c232871" -> null
        }

    Plan: 0 to add, 0 to change, 1 to destroy.

    Changes to Outputs:
      - file_name = "helloworld.txt" -> null
      - message   = "Hello World!" -> null

    Do you really want to destroy all resources?
      Terraform will destroy all your managed infrastructure, as shown above.
      There is no undo. Only 'yes' will be accepted to confirm.

      Enter a value: yes                 # <- 実行される内容を確認して yes を入力します

    local_file.helloworld: Destroying... [id=2ef7bde608ce5404e97d5f042f95f89f1c232871]
    local_file.helloworld: Destruction complete after 0s

    Destroy complete! Resources: 1 destroyed.
    ```

    