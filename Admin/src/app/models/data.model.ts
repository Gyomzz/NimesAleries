export class Data {
  private _title: string;
  private _number: string;

  constructor(title: string, number: string) {
    this._title = title;
    this._number = number;
  }


    /**
     * Getter title
     * @return {string}
     */
	public get title(): string {
		return this._title;
	}

    /**
     * Getter number
     * @return {string}
     */
	public get number(): string {
		return this._number;
	}

    /**
     * Setter title
     * @param {string} value
     */
	public set title(value: string) {
		this._title = value;
	}

    /**
     * Setter number
     * @param {string} value
     */
	public set number(value: string) {
		this._number = value;
	}



}
